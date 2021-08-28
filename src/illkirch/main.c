////////////////////////////////////////////////////////////////////////////////
//
// Codename: Illkirch B
//
// (c) Copyright 2004 Point Mad. All rights reserved.
//
//      Contributors : Julien Etelain (Point Mad)
//      added msg_generatecode (c) Florian Xaver 2007
//
////////////////////////////////////////////////////////////////////////////////
#include "kernel.h"
#include "illkirch.h"
#include "window.h"
#include "menu.h"
#include "button.h"
#include "label.h"
#include "grfx.h"
#include "tbox.h"
#include "listview.h"
#include "iodlg.h"
#include "string.h"
#include <string.h>

////////////////////////////////////////////////////////////////////////////////
l_ulong AppVersion = ULONG_ID(0,1,0,0);
char    AppName[] = "codename illkirch";
l_uid   nUID = "illkirch";
l_uid NeededLibs[] = { "widget","window","menu","grfx","button","label","textbox","listview","memfile","" };
////////////////////////////////////////////////////////////////////////////////
PList Classes;
PDevClass AddClass = NULL;
PDevClass WindowClass;
PList DefProperties;
PDevWidget RootDW = NULL; // RootDW
PImageLabel CurIMG = NULL;

PDevPType PT_String;
PDevPType PT_Int;
PDevPType PT_Bool;
PDevPType PT_Message;

PViewProp ViewProp;
PList ComboBoolItems;
PList DPTypes;
PList MsgColl;

PWidget Cnt;

PTreeView Tree  = 0;
PList ActualRes = NULL;
PIcon IconWindow = NULL;
////////////////////////////////////////////////////////////////////////////////

#define MSG_TRYOUT              0x0F0E0201

#define MSG_OPEN                0x0F0E0202
#define MSG_SAVEAS              0x0F0E0203
#define MSG_ADDWIN              0x0F0E0205

#define MSG_RESOPEN     0x0F0E0206
#define MSG_RESSAVE     0x0F0E0207
#define MSG_RESSAVEAS   0x0F0E0208
#define MSG_RESNEW              0x0F0E0209

#define MSG_RESSELECT   0x0F0E020A
#define MSG_MSGMAN              0x0F0E020B
#define MSG_GENERATECODE 0x0F0E020C

#define MSG_CLASS               0x0F0E0100
PWindow w;

l_text OpenedFile = 0;
PFileTypes Filter = 0;
PFileTypes FilterRes = 0;
////////////////////////////////////////////////////////////////////////////////
void CloseCurrent ( void ) {
        if ( RootDW ) WidgetDispose(WIDGET(RootDW));
        if ( CurIMG ) WidgetDispose(WIDGET(CurIMG));
        RootDW = NULL;
        CurIMG = NULL;
        SetPropDevWgd(NULL);
}
////////////////////////////////////////////////////////////////////////////////
void _ComboboxAddItem ( PList Items, char* Caption, BITMAP* Ico32, BITMAP* Ico16 ) {
        PListviewItem p = malloc(sizeof(TListviewItem));
        if (!p) return;
        memset(p, 0, sizeof(TListviewItem));
        p->Caption = (l_text)strdup(Caption);
        if ( Ico16 || Ico32 )
                p->Icon = NewIcon2(Ico16,Ico32,NULL);
        ListAdd (Items, Caption, p, &free);
}
////////////////////////////////////////////////////////////////////////////////
void OpeniWidget ( PiWidget i ) {
        CloseCurrent();
        RootDW = ImportFromiWidget(i);
        RootDW->Flags |= DWF_UNMOVEABLE;
        InsertWidget(WIDGET(Cnt), WIDGET(RootDW));
        WidgetDrawAll(WIDGET(Cnt));
}
////////////////////////////////////////////////////////////////////////////////
void OpenImage ( PImage bmp ) {
        TRect r;
        CloseCurrent();
        RectAssign(&r,0,0,bmp->w,bmp->h);
        CurIMG = CreateImageLabel(&Me,r,bmp);
        InsertWidget(WIDGET(Cnt), WIDGET(CurIMG));
        WidgetDrawAll(WIDGET(Cnt));
}
////////////////////////////////////////////////////////////////////////////////
void OpenNone ( void ) {
        CloseCurrent();
        WidgetDrawAll(WIDGET(Cnt));
}
////////////////////////////////////////////////////////////////////////////////
void InitNewWindow ( void ) {
        PListItem i;
        Tree->Sel = AddTreeItem(Tree->Items,(l_text)ListKey(RootDW->Properties,"name"),NULL,IconWindow,NULL);
        i = NewListItemEx((l_text)ListKey(RootDW->Properties,"name"),ConvertToiWidget(RootDW),(void*)&FreeiWidget,DTYPE_IWIDGET,0);
        ListAddItem(ActualRes,i);
        TreeviewScrollBarRecalculate(Tree);
}
////////////////////////////////////////////////////////////////////////////////
void InitStandAloneWindow ( void ) {
        if ( ActualRes ) FreeList(ActualRes);
        if ( MsgColl ) FreeList(MsgColl);
        ActualRes = NewList();
        MsgColl = NewList();
        EmptySubTreeItems(Tree->Items);
        InitNewWindow();
}
////////////////////////////////////////////////////////////////////////////////
void FlushCurrentToRes ( void ) {
        if ( RootDW ) {
                PListItem i = ListKeyItem(ActualRes,ListKey(RootDW->Properties,"name"));
                if ( i ) {
                        if( i->Data ) FreeiWidget((PiWidget)i->Data);
                        i->Data = ConvertToiWidget(RootDW);
                }
        }
}
////////////////////////////////////////////////////////////////////////////////
void FlushMsgColl ( void ) {
        if ( MsgColl ) {
                PBinData b = MsgInfoGenerateStore();
                PListItem i = ListKeyItem(ActualRes,".msgcoll");
                if ( i ) {
                        if ( i->Data && i->FreeData ) i->FreeData(i->Data);
                        i->DataType = DTYPE_BINDATA;
                        i->Data = b;
                } else {
                        i = NewListItemEx(".msgcoll",b,(void*)&FreeBinData,DTYPE_BINDATA,0);
                        ListAddItem(ActualRes,i);
                }
        }
}
////////////////////////////////////////////////////////////////////////////////
void LoadMsgColl ( void ) {
        PListItem i = ListKeyItem(ActualRes,".msgcoll");
        if ( i ) {
                if ( i->DataType == DTYPE_BINDATA )
                        MsgInfoInitFromStore((PBinData)i->Data);
        } else
                ResetMsgInfo();
}
////////////////////////////////////////////////////////////////////////////////
void GenerateCode( void ) {

// todo

}
////////////////////////////////////////////////////////////////////////////////
l_bool AppEventHandler ( PWidget o, PEvent Ev )
{
        if ( Ev->Type == EV_MESSAGE )
        {
                if ( Ev->Message == MSG_RESNEW ) {
                        if ( ActualRes ) FreeList(ActualRes);
                        ActualRes = NewList();
                        EmptySubTreeItems(Tree->Items);
                        ResetMsgInfo();
                        if ( OpenedFile ) free(OpenedFile);
                        OpenedFile = NULL;
                        WidgetDrawAll(WIDGET(Tree));
                        ScrollBarRedraw(SLLWDG(Tree));
                        OpenNone();
                        WindowSetCaption(w, "codename illkirch - new");
                        return true;
                }


                if ( Ev->Message == WM_CLOSE )
                {
                        CloseApp(&Me);
                        return true;
                }
                if ( Ev->Message  == MSG_RESSELECT ) {
                        if ( Tree->Sel  && ActualRes ) {
                                PListItem i = ListKeyItem(ActualRes,Tree->Sel->Caption);
                                if ( i->DataType == DTYPE_IWIDGET ) {
                                        FlushCurrentToRes();
                                        OpeniWidget((PiWidget)i->Data);
                                } else if ( i->DataType == DTYPE_IMAGE ) {
                                        FlushCurrentToRes();
                                        OpenImage((PImage)i->Data);
                                }
                        }
                        return true;
                }

                if ( Ev->Message  == MSG_TRYOUT ) {
                        PiWidget i = ConvertToiWidget ( RootDW );
                        PWidget a = ComplieiWidget(&Me,i);
                        InsertWidget(DeskTop, a);
                        WidgetDrawAll(a);
                        FreeiWidget(i);
                        return true;
                }

                if ( Ev->Message  == MSG_OPEN ) {
                        l_text file = IOBox("Open", IOBOX_OPEN, NULL, Filter, true);
                        if ( file )
                        {
                                PiWidget i = LoadData2(file,DTYPE_IWIDGET);
                                if ( i )
                                {
                                        ResetMsgInfo();
                                        OpeniWidget(i);
                                        FreeiWidget(i);
                                        InitStandAloneWindow();
                                        WidgetDrawAll(WIDGET(Tree));
                                        ScrollBarRedraw(SLLWDG(Tree));

                                }
                                WindowSetCaption(w, "codename illkirch - new from %s", file);

                                free(file);
                        }
                        return true;
                }

                if ( Ev->Message == MSG_SAVEAS ) {

                                l_text File = IOBox("Save", IOBOX_SAVE, NULL, Filter, false);

                                if ( File )
                                {
                                        PiWidget i = ConvertToiWidget ( RootDW );
                                        if ( i ) {
                                                if ( !SaveData2(File, i, DTYPE_IWIDGET) )
                                                {
                                                        DebugError("ILLKIRCH : Unable to save window");
                                                }
                                                FreeiWidget(i);
                                        }

                                        free(File);
                                }
                                return true;
                }

                if ( Ev->Message == MSG_ADDWIN ) {
                        TRect r;
                        FlushCurrentToRes();
                        CloseCurrent();
                        RectAssign(&r,0,0,200,200);
                        RootDW = CreateDevWidget(r,WindowClass);
                        RootDW->Flags |= DWF_UNMOVEABLE;
                        InsertWidget(WIDGET(Cnt), WIDGET(RootDW));
                        InitNewWindow();

                        WidgetDrawAll(WIDGET(Tree));
                        ScrollBarRedraw(SLLWDG(Tree));

                        return true;
                }
                if ( Ev->Message == MSG_RESOPEN ) {

                        l_text file = IOBox("Open project",IOBOX_OPEN,NULL,FilterRes,true);
                        if ( file ) {
                                PList NewRes = LoadRessourceFile(file);
                                PIcon Ico = NULL;
                                PListItem a, b, c = NULL; PTreeItem i;

                                if ( !NewRes ) return true;

                                if ( ActualRes ) FreeList(ActualRes);
                                EmptySubTreeItems(Tree->Items);

                                ActualRes = NewRes;

                                LoadMsgColl();

                                if ( ActualRes->Last ) {
                                        a = b = ActualRes->Last->Next;
                                        do {
                                                if (a->DataType == DTYPE_IWIDGET) {
                                                        Ico = IconWindow;
                                                        if ( !c ) c = a;
                                                } else
                                                        Ico = NULL;

                                                i = AddTreeItem(Tree->Items,a->Key,NULL,Ico,NULL);

                                                if ( c == a ) Tree->Sel = i;
                                                a = a->Next;
                                        } while ( a != b );
                                }
                                if ( c ) {
                                        OpeniWidget((PiWidget)c->Data);
                                        TreeviewScrollBarRecalculate(Tree);
                                } else {
                                        TreeviewScrollBarRecalculate(Tree);
                                }
                                WidgetDrawAll(WIDGET(Tree));
                                ScrollBarRedraw(SLLWDG(Tree));

                                if ( OpenedFile ) free(OpenedFile);
                                OpenedFile = TextDup(file);

                                WindowSetCaption(w, "codename illkirch - %s", file);

                                free(file);
                        }
                        return true;
                }

                if ( Ev->Message == MSG_RESSAVE ) {


                                if ( OpenedFile )
                                {
                                        FlushMsgColl();
                                        FlushCurrentToRes();
                                        SaveRessourceFile(OpenedFile,ActualRes);

                                }
                                return true;
                }

                if ( Ev->Message == MSG_GENERATECODE ) {
                                l_text file = IOBox("Generate code...", IOBOX_SAVE, NULL, Filter, false);

                                if ( file )
                                {
                                GenerateCode();
                                }
                                return true;

                }

                if ( Ev->Message == MSG_RESSAVEAS ) {

                                l_text file = IOBox("Save project", IOBOX_SAVE, NULL, FilterRes, false);

                                if ( file )
                                {
                                        FlushMsgColl();
                                        FlushCurrentToRes();
                                        SaveRessourceFile(file,ActualRes);
                                        if ( OpenedFile ) free(OpenedFile);
                                        OpenedFile = TextDup(file);
                                        WindowSetCaption(w, "codename illkirch - %s", file);
                                        free(file);
                                }
                                return true;
                }
/*
                        CloseCurrent();
                        RootDW = ImportFromiWidget(i);
                        RootDW->Flags |= DWF_UNMOVEABLE;
                        InsertWidget(WIDGET(Cnt), WIDGET(RootDW));
                        WidgetDrawAll(WIDGET(Cnt));
*/
                if ( (( Ev->Message >> 8 ) << 8)  == MSG_CLASS ) {
                        l_ulong idx = Ev->Message - MSG_CLASS;
                        AddClass = ListAt(Classes,idx);
                        return true;
                }

                if ( Ev->Message == WM_ABOUT ) {
                        AboutIllkirch();
                        return true;
                }

                if ( Ev->Message == MSG_MSGMAN ) {
                        MsgMan();
                        return true;
                }

        }

        return false;
}
////////////////////////////////////////////////////////////////////////////////
void DrawPropInt ( p_bitmap buffer, TRect r,  void *value ) {
        if ( value ) {
                l_text txt = TextArgs("%d",*((l_int*)value));
                DrawNiceText(buffer,default_font,r.a.x+1,r.a.y,r.b.x-r.a.x,txt,COL_BOXTEXT);
                free(txt);
        }
}
////////////////////////////////////////////////////////////////////////////////
void DrawPropMessage ( p_bitmap buffer, TRect r,  void *value ) {
        if ( value ) {
                l_text txt = TextArgs("%x",*((l_ulong*)value));
                DrawNiceText(buffer,default_font,r.a.x+1,r.a.y,r.b.x-r.a.x-20,txt,COL_BOXTEXT);
                free(txt);
        }
        rectfill(buffer,r.b.x-15,r.a.y+1,r.b.x+1,r.b.y-1,COL_3DFACE);
        rect(buffer,r.b.x-15,r.a.y+1,r.b.x+1,r.b.y-1,COL_3DDARK);
        textout_ex(buffer, default_font, "...", r.b.x-12, r.a.y+2, COL_3DTEXT,-1);
}
////////////////////////////////////////////////////////////////////////////////
void DrawPropBool ( p_bitmap buffer, TRect r,  void *value ) {
        if ( value ) {
                l_text txt = *((l_bool*)value)?"true":"false";
                DrawNiceText(buffer,default_font,r.a.x+1,r.a.y,r.b.x-r.a.x,txt,COL_BOXTEXT);
        }
}
////////////////////////////////////////////////////////////////////////////////
void DrawPropString ( p_bitmap buffer, TRect r,  void *value ) {
        if ( value )
                DrawNiceText(buffer,default_font,r.a.x+1,r.a.y,r.b.x-r.a.x,(l_text)value,COL_BOXTEXT);
}
////////////////////////////////////////////////////////////////////////////////
void DrawPropMenu ( p_bitmap buffer, TRect r,  void *value ) {
        DrawNiceText(buffer,default_font,r.a.x+1,r.a.y,r.b.x-r.a.x,"Menu [...]",COL_BOXTEXT);
}
////////////////////////////////////////////////////////////////////////////////
void DrawPropFlags ( p_bitmap buffer, TRect r,  void *value ) {
        if ( value ) {
                l_text txt = TextArgs("%08x [...]",*((l_ulong*)value));
                DrawNiceText(buffer,default_font,r.a.x+1,r.a.y,r.b.x-r.a.x,txt,COL_BOXTEXT);
                free(txt);
        }
}
////////////////////////////////////////////////////////////////////////////////
void SetToolPropInt ( PDevProp t, PDevWidget w, PViewProp o, TRect r, l_ulong xpos ) {
        l_text txt, n;
        void *value = ListKey(w->Properties,t->Name);
        if ( !value ) value = t->DefValue;
        txt = TextArgs("%d",value?*((l_int*)value):0);
        n = PropViewSetToolHelperString(o,r,txt);
        if ( n ) {
                l_int nv = atoi(n);
                DevWidgetSetProperty(w,t->Name,&nv);
                free(n);
        }
        free(txt);
}
////////////////////////////////////////////////////////////////////////////////
void SetToolPropMessage ( PDevProp t, PDevWidget w, PViewProp o, TRect r, l_ulong xpos ) {
        r.b.x -= 16;
        if ( xpos < r.b.x ) {
                l_text txt, n;
                void *value = ListKey(w->Properties,t->Name);
                if ( !value ) value = t->DefValue;
                txt = TextArgs("%x",value?*((l_ulong*)value):0);
                n = PropViewSetToolHelperString(o,r,txt);
                if ( n ) {
                        l_ulong nv = strtoul(n,NULL,16);
                        DevWidgetSetProperty(w,t->Name,&nv);
                        free(n);
                }
                free(txt);
        } else {
                l_ulong *value = ListKey(w->Properties,t->Name), n;
                if ( !value ) value = t->DefValue;
                n = MsgSelect(*value);
                DevWidgetSetProperty(w,t->Name,&n);
        }
}
////////////////////////////////////////////////////////////////////////////////
void SetToolPropFlags ( PDevProp t, PDevWidget w, PViewProp o, TRect r, l_ulong xpos ) {
        l_ulong Flags;
        l_ulong *Value = ListKey(w->Properties,t->Name);
        if ( !Value ) Value = t->DefValue;
        Flags = PropViewSetToolHelperFlags ( o, r, *Value, t->Real->Extra );
        if ( Flags != *Value ) {
                DevWidgetSetProperty(w,t->Name,&Flags);
        }
}
////////////////////////////////////////////////////////////////////////////////
void SetToolPropString ( PDevProp t, PDevWidget w, PViewProp o, TRect r, l_ulong xpos ) {
        l_text n;
        void *value = ListKey(w->Properties,t->Name);
        if ( !value ) value = t->DefValue;
        n = PropViewSetToolHelperString(o,r,(l_text)value);
        if ( n ) {
                DevWidgetSetProperty(w,t->Name,n);
                free(n);
        }
}
////////////////////////////////////////////////////////////////////////////////
void SetToolPropBool ( PDevProp t, PDevWidget w, PViewProp o, TRect r, l_ulong xpos ) {
        l_int idx = 0;

        void *value = ListKey(w->Properties,t->Name);
        if ( !value ) value = t->DefValue;
        if ( value ) idx = (*(l_bool*)value)+1;
        idx = PropViewSetToolHelperCombobox ( o, r, idx, ComboBoolItems );
        if ( idx ) {
                l_bool nv = idx-1;
                DevWidgetSetProperty(w,t->Name,&nv);
        }
}
////////////////////////////////////////////////////////////////////////////////
void SetToolPropMenu ( PDevProp t, PDevWidget w, PViewProp o, TRect r, l_ulong xpos ) {
        l_int idx = 0;
        PMenu n = NULL, m = (PMenu)ListKey(w->Properties,t->Name);
        n = MenuEditor(m);
        if ( n ) {
                DevWidgetSetProperty(w,t->Name,n);
                FreeMenu(n);
        }
}
////////////////////////////////////////////////////////////////////////////////
l_int Main ( int argc, l_text *argv ) {
        PListItem i;
        TRect r;
        TPoint t;
        PButton b;

        Classes = NewList();
        DefProperties = NewList();
        ComboBoolItems = NewList();
        DPTypes = NewList();
        MsgColl = NewList();

        Filter =        NewFileTypes("oZone iWidget","oiw",
                                NewFileTypes("All files",NULL,
                                NULL ));
        FilterRes = NewFileTypes("Illkirch project (*.ipr)","ipr",
                                        NewFileTypes("Ressource files (*.res)","res",
                                        NewFileTypes("DynLD binary executable (*.app,*.dl)","app,dl",
                                        NewFileTypes("All files",NULL,
                                        NULL ))));

        IconWindow = NewIcon2(ListKey(Me.Ressource,"WIN"),NULL,NULL);

        _ComboboxAddItem(ComboBoolItems,"false",NULL,NULL);
        _ComboboxAddItem(ComboBoolItems,"true",NULL,NULL);

        PT_String = NewDevPType(PTYPE_STRING,0,&SetToolPropString,&DrawPropString);
        PT_Int = NewDevPType(PTYPE_INT,0,&SetToolPropInt,&DrawPropInt);
        PT_Bool = NewDevPType(PTYPE_BOOL,0,&SetToolPropBool,&DrawPropBool);
        PT_Message = NewDevPType(PTYPE_MESSAGE,0,&SetToolPropMessage,&DrawPropMessage);
        NewDevPType(PTYPE_FLAGS,0,&SetToolPropFlags,&DrawPropFlags);
        NewDevPType(PTYPE_MENU,0,&SetToolPropMenu,&DrawPropMenu);

        AddDevProp(DefProperties,"name",NULL,PT_String,NULL);
        AddDevProp(DefProperties,"r.a.x",NULL,PT_Int,NULL);
        AddDevProp(DefProperties,"r.a.y",NULL,PT_Int,NULL);
        AddDevProp(DefProperties,"r.b.x",NULL,PT_Int,NULL);
        AddDevProp(DefProperties,"r.b.y",NULL,PT_Int,NULL);

        InitDevClass();
        WindowClass = AddDevClassFrom("window",ListKey(Me.Ressource,"WIN"),ULONG_ID('W','i','n',' '));

        AddDevClassFrom("button",ListKey(Me.Ressource,"BTN"),ULONG_ID('B','t','n',' '));
        AddDevClassFrom("label",ListKey(Me.Ressource,"LBL"),ULONG_ID('L','b','l',' '));
        AddDevClassFrom("slider",ListKey(Me.Ressource,"SLD"),ULONG_ID('S','l','d','r'));
        AddDevClassFrom("textbox",ListKey(Me.Ressource,"TXT"),ULONG_ID('T','x','t','B'));
        AddDevClassFrom("listview",ListKey(Me.Ressource,"LSTV"),ULONG_ID('L','s','t','V'));
        AddDevClassFrom("checkbox",ListKey(Me.Ressource,"CHCK"),ULONG_ID('C','h','k','B'));
        AddDevClassFrom("dirview",ListKey(Me.Ressource,"DRVW"),ULONG_ID('D','r','V','w'));
        AddDevClassFrom("dirtreeview",ListKey(Me.Ressource,"DTRV"),ULONG_ID('D','T','r','V'));
        AddDevClassFrom("treeview",ListKey(Me.Ressource,"TRVW"),ULONG_ID('T','r','e','V'));
        AddDevClassFrom("groupbox",ListKey(Me.Ressource,"FRAM"),ULONG_ID('G','r','p','B'));
        AddDevClassFrom("progress",ListKey(Me.Ressource,"PGRS"),ULONG_ID('P','r','g','s'));
        AddDevClassFrom("menuview",ListKey(Me.Ressource,"MENU"),ULONG_ID('M','e','n','u'));

        AddDevClassFrom("splitv",ListKey(Me.Ressource,"VSPLIT"),WCLASS_VSPLITER);
        AddDevClassFrom("splith",ListKey(Me.Ressource,"HSPLIT"),WCLASS_HSPLITER);

        if ( WidgetClasses->Last ) {
                PListItem a,b;
                l_uchar TId[5] = "####";
                a = b = WidgetClasses->Last->Next;
                do {
                        TId[0] = ULID_A(WCLASS(a->Data)->Id);
                        TId[1] = ULID_B(WCLASS(a->Data)->Id);
                        TId[2] = ULID_C(WCLASS(a->Data)->Id);
                        TId[3] = ULID_D(WCLASS(a->Data)->Id);
                        DebugMessage("Class ID#%x (%s)(%s) : %s",WCLASS(a->Data)->Id,TId,
                        GetDevClass(WCLASS(a->Data)->Id)?"Installed":"Not installed",
                        WCLASS(a->Data)->SetRProp?"support advanced iwidget":"basic iwidget support");
                        a = a->Next;
                } while ( a != b );




        }

        RectAssign(&r,0, 0, 500, 400);
        w = CreateWindow( &Me, r, "codename illkirch - new", WF_FRAME|WF_CAPTION|WF_MINIMIZE|WF_CENTERED|WF_RESIZE );
        WIDGET(w)->AppEvHdl = &AppEventHandler;
        InsertWidget(DeskTop, WIDGET(w));

        PMenu Menu = NewMenu(
     NewMenuItem( "File", NULL, NULL, NULL,
                 NewMenu (
                                NewMenuItem( "New", NULL, MSG_RESNEW, NULL, NULL,
                                NewMenuItem( "Open...", NULL, MSG_RESOPEN, NULL, NULL,
                                NewMenuItem( "Save", NULL, MSG_RESSAVE, NULL, NULL,
                                NewMenuItem( "Save as...", NULL, MSG_RESSAVEAS, NULL, NULL,
                                NewMenuItemSeparator(
                                NewMenuItem( "Generate code", NULL, MSG_GENERATECODE, NULL, NULL,
                                NewMenuItemSeparator(
                                NewMenuItem( "Exit", NULL, WM_CLOSE, NULL, NULL,
                                NULL))))))))
                 ),
     NewMenuItem( "Project", NULL, NULL, NULL,
                                        NewMenu (
                                NewMenuItem( "Add window", NULL, MSG_ADDWIN, NULL, NULL,
                                NewMenuItem( "Messages", NULL, MSG_MSGMAN, NULL, NULL,
                                NULL))
                 ),
     NewMenuItem( "Window", NULL, NULL, NULL,
                                        NewMenu (
                                NewMenuItem( "Test window through iWidget", NULL, MSG_TRYOUT, NULL, NULL,
                                NewMenuItem( "Open... (in a new project)", NULL, MSG_OPEN, NULL, NULL,
                                NewMenuItem( "Save as...", NULL, MSG_SAVEAS, NULL, NULL,
                                NULL)))
                 ),
     NewMenuItem( "Help", NULL, NULL, NULL,
        NewMenu(
                NewMenuItem( "Help", NULL, NULL, NULL, NULL,
                NewMenuItem( "Programmation reference", NULL, NULL, NULL, NULL,
                NewMenuItemSeparator(
                NewMenuItem( "About", NULL, WM_ABOUT, NULL, NULL,
                NULL))))
        ),
     NULL))))
        );

        RectAssign(&r,0,0,500,20);

        PMenuView o = NewMenuView(&Me,r,Menu,MenuViewStyleHorizontal,0);
        InsertWidget(WIDGET(w), WIDGET(o));

        RectAssign(&r,0,20,35,45);

        if ( Classes->Last ) {
                l_ulong idx = 1;
                PListItem a = Classes->Last->Next,l=a;
                do {
                        b = CreateButton(&Me,r,NULL,MSG_CLASS+idx);
                        b->Icon = DEVCLASS(a->Data)->Icon16;
                        InsertWidget(WIDGET(w), WIDGET(b));
                        if ( r.a.x == 40 )
                                RectAssign(&r,0,r.a.y+30,35,r.b.y+30);
                        else
                                RectAssign(&r,40,r.a.y,75,r.b.y);
                        idx++;
                        a = a->Next;
                } while ( a != l );
        }

        t.x = WIDGET(w)->ChildArea.b.x-WIDGET(w)->ChildArea.a.x;
        t.y = WIDGET(w)->ChildArea.b.y-WIDGET(w)->ChildArea.a.y;

        RectAssign(&r,t.x-200,20,t.x,115);
        Tree = CreateTreeView(&Me,r,0);
        Tree->OnSelMsg = MSG_RESSELECT;


        WIDGET(Tree)->Flags |= WF_AUTORESIZE|WF_FIXEDWIDTH|WF_MAGNETRIGHT;
        /*if ( SLLWDG(Tree)->Horizontal )
                WIDGET(SLLWDG(Tree)->Horizontal)->Flags |= WF_AUTORESIZE|WF_MAGNETRIGHT|WF_FIXEDWIDTH;
        if ( SLLWDG(Tree)->Vertical )
                WIDGET(SLLWDG(Tree)->Vertical)->Flags |= WF_AUTORESIZE|WF_MAGNETRIGHT|WF_FIXEDWIDTH;
        */

        InsertWidget(WIDGET(w), WIDGET(Tree));

        RectAssign(&r,t.x-200,120,t.x,t.y-20);

        ViewProp = CreateViewProp(r);

        WIDGET(ViewProp)->Flags |= WF_AUTORESIZE|WF_FIXEDWIDTH|WF_MAGNETRIGHT|WF_MAGNETBOTTOM;
        //WIDGET(SLLWDG(ViewProp)->Vertical)->Flags |= WF_AUTORESIZE|WF_MAGNETRIGHT|WF_MAGNETBOTTOM|WF_FIXEDWIDTH;


        InsertWidget(WIDGET(w), WIDGET(ViewProp));


        RectAssign(&r,80,20,t.x-202,t.y-1);

        Cnt = CreateWidget(&Me,r);
        Cnt->Flags |= WF_AUTORESIZE|WF_MAGNETRIGHT|WF_MAGNETBOTTOM;
        Cnt->BackgroundColor = makecol(255,255,255);
        InsertWidget(WIDGET(w), WIDGET(Cnt));


        RectAssign(&r,0,0,200,200);
        RootDW = CreateDevWidget(r,WindowClass);
        RootDW->Flags |= DWF_UNMOVEABLE;
        InsertWidget(WIDGET(Cnt), WIDGET(RootDW));

        InitStandAloneWindow();

        WidgetDrawAll(WIDGET(w));

        return true;

}
////////////////////////////////////////////////////////////////////////////////
void Close (void) {

        DisposeAllAppWidgets(&Me);

        if ( MsgColl ) FreeList(MsgColl);
        if ( ActualRes ) FreeList(ActualRes);
        if ( Classes ) FreeList(Classes);
        if ( DefProperties ) FreeList(DefProperties);
        if ( ComboBoolItems ) FreeList(ComboBoolItems);
        if ( DPTypes ) FreeList(DPTypes);
        if ( Filter ) FreeFileTypes(Filter);
        if ( FilterRes ) FreeFileTypes(FilterRes);
        if ( IconWindow ) FreeIcon(IconWindow);
}
////////////////////////////////////////////////////////////////////////////////
