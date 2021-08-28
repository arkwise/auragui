////////////////////////////////////////////////////////////////////////////////
//
// Codename: Illkirch B
//
// (c) Copyright 2004 Point Mad. All rights reserved.
//
//      Contributors : Julien Etelain (Point Mad)
//
////////////////////////////////////////////////////////////////////////////////

#include"kernel.h"
#include"window.h"
#include"label.h"
#include"iodlg.h"
#include"tbox.h"
#include"button.h"
#include"menu.h"
#include"illkirch.h"
#include <string.h>
////////////////////////////////////////////////////////////////////////////////
typedef struct TTreeMenuItem *PTreeMenuItem;
typedef struct TTreeMenuItem
{
        struct TTreeItem o;

        l_ulong Message;

} TTreeMenuItem;

#define TREEMENUITEM(o) ((PTreeMenuItem)(o))
////////////////////////////////////////////////////////////////////////////////
PTreeMenuItem TreeDirviewAddItem ( PTreeItem Parent, l_text Name, l_text Caption, l_ulong Message ) {
        PTreeMenuItem i = malloc(sizeof(TTreeDirviewItem));
        if ( !i ) return;
        memset(i,0,sizeof(TTreeDirviewItem));
        TreeviewInitItem(TREEVIEWITEM(i),Caption,Name,NULL,NULL,NULL);
        i->Message = Message;
        TreeviewAddItem(Parent,TREEVIEWITEM(i));
        return i;
}
////////////////////////////////////////////////////////////////////////////////
#define MSG_SEL     0x33FF0001
#define MSG_NEWSUB  0x33FF0002
#define MSG_REMOVE  0x33FF0003

////////////////////////////////////////////////////////////////////////////////
PMenu MenuFromTree ( PTreeItem Parent ) {
        if ( Parent->Last ) {
                PTreeItem a = Parent->Last->Next;
                PTreeItem b = a;
                PMenu m = NewMenu(NULL), Sub;
                do {
                        Sub = NULL;
                        if ( a->Last ) Sub = MenuFromTree(a);

                        AddMenuItem ( m, a->Caption, NULL, TREEMENUITEM(a)->Message, NULL, Sub );

                        a = a->Next;
                } while ( a != b );
                return m;
        }
        return NULL;
}
////////////////////////////////////////////////////////////////////////////////
void TreeFromMenu( PMenu m, PTreeItem Parent ) {
        PTreeItem New;
        PMenuItem i = m->Items;
        while ( i ) {
                New = (PTreeItem)TreeDirviewAddItem( Parent, i->Name, i->Caption, i->Message );
                if ( i->SubMenu )
                        TreeFromMenu(i->SubMenu,New);
                i = i->Next;
        }
}
////////////////////////////////////////////////////////////////////////////////
PMenu MenuEditor( PMenu Menu ) {

        l_ulong Msg;
        PLabel l;
        PButton b;
        PTreeView t     = 0;
        PWindow w = 0;
        PTextbox iName = 0;
        PTextbox iCaption = 0;
        PTextbox iMessage = 0;
        PTreeMenuItem Current = NULL;
        TRect r;

        RectAssign(&r,0, 0, 400, 300);
        w = CreateWindow(&Me, r, "codename illkirch : Menu Editor", WF_NORMAL|WF_CENTERED);
        InsertWidget(WIDGET(DeskTop), WIDGET(w));

        RectAssign(&r,0, 0, 195, 300);
        t = CreateTreeView(&Me,r,MSG_SEL);
        InsertWidget(WIDGET(w), WIDGET(t));

        t->Flags &= ~TVF_DRAWICONS;

        RectAssign(&r, 200, 0, 250, 20);
        l = CreateLabel(&Me,r,"Name :");
        InsertWidget(WIDGET(w), WIDGET(l));

        RectAssign(&r, r.b.x+5, r.a.y,  400, r.b.y);
        iName = CreateTextbox(&Me,r,TBF_EDITABLE);
        InsertWidget(WIDGET(w), WIDGET(iName));

        RectAssign(&r, 200, r.b.y+5, 250, r.b.y+25);
        l = CreateLabel(&Me,r,"Caption :");
        InsertWidget(WIDGET(w), WIDGET(l));

        RectAssign(&r, r.b.x+5, r.a.y,  400, r.b.y);
        iCaption = CreateTextbox(&Me,r,TBF_EDITABLE);
        InsertWidget(WIDGET(w), WIDGET(iCaption));

        RectAssign(&r, 200, r.b.y+5, 250, r.b.y+25);
        l = CreateLabel(&Me,r,"Message :");
        InsertWidget(WIDGET(w), WIDGET(l));

        RectAssign(&r, r.b.x+5, r.a.y,  400, r.b.y);
        iMessage = CreateTextbox(&Me,r,TBF_EDITABLE);
        InsertWidget(WIDGET(w), WIDGET(iMessage));

        RectAssign(&r, 200, r.b.y+10, 300, r.b.y+30);
        b = CreateButton(&Me,r,"New",MSG_NEWSUB);
        InsertWidget(WIDGET(w), WIDGET(b));

        RectAssign(&r, 305, r.a.y, 400, r.b.y);
        b = CreateButton(&Me,r,"Remove",MSG_REMOVE);
        InsertWidget(WIDGET(w), WIDGET(b));

        RectAssign(&r, 200, 280, 300, 300);
        b = CreateButton(&Me,r,"OK",MSG_OK);
        InsertWidget(WIDGET(w), WIDGET(b));

        RectAssign(&r, 305, r.a.y, 400, r.b.y);
        b = CreateButton(&Me,r,"Cancel",WM_CLOSE);
        InsertWidget(WIDGET(w), WIDGET(b));

        if ( Menu ) TreeFromMenu(Menu,t->Items);

        WidgetDrawAll(WIDGET(w));

        do {
                Msg = WidgetExecute(WIDGET(w));

                if ( Msg == MSG_REMOVE ) {

                        if ( Current ) TreeViewDeleteItem(t,(PTreeItem)Current);

                        Current = NULL;

                } else {

                        if ( Current ) {
                                if ( TREEVIEWITEM(Current)->Key ) free(TREEVIEWITEM(Current)->Key);
                                if ( !TextCompare("",iName->Text) )
                                        TREEVIEWITEM(Current)->Key = NULL;
                                else
                                        TREEVIEWITEM(Current)->Key = TextDup(iName->Text);
                                TreeViewRenameItem(t,(PTreeItem)Current,iCaption->Text);
                                Current->Message = strtoul(iMessage->Text,NULL,16);
                        }

                        if ( Msg == MSG_NEWSUB ) {
                                PTreeMenuItem New;
                                if ( !Current ) {
                                        New = TreeDirviewAddItem(t->Items,NULL,"New item",0);
                                        TreeviewScrollBarRecalculate(t);
                                        WidgetDraw(WIDGET(t), NULL);
                                        ScrollBarRedraw(SLLWDG(t));
                                } else {
                                        New = TreeDirviewAddItem(t->Sel,NULL,"New item",0);
                                        TreeviewExpendItem(t,t->Sel);
                                }
                                //TreeViewSelectItem(t,(PTreeItem)New);
                                //Msg = MSG_SEL;
                        }

                        if ( Msg == MSG_SEL ) {
                                Current = TREEMENUITEM(t->Sel);
                                if ( Current ) {
                                        if ( !TREEVIEWITEM(Current)->Key )
                                                TextBoxSetText(iName,"");
                                        else
                                                TextBoxSetText(iName,TREEVIEWITEM(Current)->Key);
                                        TextBoxSetText(iCaption,TREEVIEWITEM(Current)->Caption);
                                        TextBoxSetText(iMessage,"%x",Current->Message);
                                } else {
                                        TextBoxSetText(iName,"");
                                        TextBoxSetText(iCaption,"");
                                        TextBoxSetText(iMessage,"");
                                }
                        }
                }

        } while ( (Msg != WM_CLOSE) && (Msg != MSG_OK) );

        if ( Msg == MSG_OK ) {
                PMenu m = MenuFromTree(t->Items);
                WidgetDispose(WIDGET(w));
                return m;
        }
        WidgetDispose(WIDGET(w));
        return NULL;
}
////////////////////////////////////////////////////////////////////////////////
