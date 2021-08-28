/**
*	Copyright (c) 2003-2004 Lukas Lipka. All rights reserved.
*
*	FILE: laby.c
*
*	PROJECT: Codename Phoenix - GAME
*
*	DESCRIPTION: A simple labyrint game.
*
*	CONTRIBUTORS:
*						Lukas Lipka (2003-07-03)
*
*	CHANGES:
*				Rewritten from scratch, with new functions (LL)
*/

#include "kernel.h"
#include "widget.h"
#include "button.h"
#include "canvas.h"
#include "window.h"
#include "timer.h"

l_ulong UID			= ULONG_ID('L','A','B','Y');
l_ulong AppVersion	= ULONG_ID(0,0,1,0);
char AppName[]		= "Laby";

_PUBLIC l_int WhereX	= 1;
_PUBLIC l_int WhereY	= 1;
_PUBLIC PCanvas Laby	= 0;
_PUBLIC l_int Level		= 1;

/**
*	Map information
*/
_PUBLIC l_int MapLevels = 0;

#define MAPSIZE	20
l_char MapDAT[MAPSIZE][MAPSIZE] =
{
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0 },
{ 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0 },
{ 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0 },
{ 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0 },
{ 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0 },
{ 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 },
{ 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0 },
{ 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0 },
{ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0 },
{ 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0 },
{ 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0 },
{ 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0 },
{ 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0 },
{ 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0 },
{ 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 2, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

_PUBLIC void LoadMap ( l_text szFile )
{
	FILE *f = fopen(szFile, "rt");
	int i = 0;

	if (!f) return;

	while (i < MAPSIZE)
	{
		//fscanf(f, "[%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i][%i]", &MapDAT[i][0], &MapDAT[i][1], &MapDAT[i][2], &MapDAT[i][3], &MapDAT[i][4], &MapDAT[i][5], &MapDAT[i][6],&MapDAT[i][7],&MapDAT[i][8],&MapDAT[i][9],&MapDAT[i][10],&MapDAT[i][11],&MapDAT[i][12],&MapDAT[i][13],&MapDAT[i][14],&MapDAT[i][15],&MapDAT[i][16],&MapDAT[i][17],&MapDAT[i][18],&MapDAT[i][19]);
		i++;
	}

	fclose(f);
}

_PUBLIC void  GameDraw(PWidget o, p_bitmap buffer, PRect w)
{
	l_int x = 0, y = 0;

	rectfill(buffer, o->Absolute.a.x, o->Absolute.a.y, o->Absolute.b.x, o->Absolute.b.y, makecol(0,0,0));

	while ( y < 6 )
	{
		while ( x < 6 )
		{
			l_int vx = WhereX-3+x;
			l_int vy = WhereY-3+y;

			if (vx > 0 && vx < MAPSIZE && vy > 0 && vy < MAPSIZE)
			{
				/**
				*	Object?
				*/
				if ( MapDAT[vx][vy] == 0 )
				{
					rectfill(buffer, o->Absolute.a.x+(x*((o->Absolute.b.x-o->Absolute.a.x)/5)) - (o->Absolute.b.x-o->Absolute.a.x)/5, o->Absolute.a.y+(y*((o->Absolute.b.y-o->Absolute.a.y)/5)) - (o->Absolute.b.y-o->Absolute.a.y)/5, o->Absolute.a.x+(x*((o->Absolute.b.x-o->Absolute.a.x)/5)), o->Absolute.a.y+(y*((o->Absolute.b.y-o->Absolute.a.y)/5)), makecol(0,150,0));
				}
				else if ( MapDAT[vx][vy] == 1)
				{
					rectfill(buffer, o->Absolute.a.x+(x*((o->Absolute.b.x-o->Absolute.a.x)/5)) - (o->Absolute.b.x-o->Absolute.a.x)/5, o->Absolute.a.y+(y*((o->Absolute.b.y-o->Absolute.a.y)/5)) - (o->Absolute.b.y-o->Absolute.a.y)/5, o->Absolute.a.x+(x*((o->Absolute.b.x-o->Absolute.a.x)/5)), o->Absolute.a.y+(y*((o->Absolute.b.y-o->Absolute.a.y)/5)), makecol(0,128,128));
				}
				else if ( MapDAT[vx][vy] == 2)
				{
					rectfill(buffer, o->Absolute.a.x+(x*((o->Absolute.b.x-o->Absolute.a.x)/5)) - (o->Absolute.b.x-o->Absolute.a.x)/5, o->Absolute.a.y+(y*((o->Absolute.b.y-o->Absolute.a.y)/5)) - (o->Absolute.b.y-o->Absolute.a.y)/5, o->Absolute.a.x+(x*((o->Absolute.b.x-o->Absolute.a.x)/5)), o->Absolute.a.y+(y*((o->Absolute.b.y-o->Absolute.a.y)/5)), makecol(128,128,128));
				}
			}

			x++;
		}

		y++;
		x = 1;
	}

	/**
	*	Character
	*/
	rectfill(buffer, o->Absolute.a.x+(o->Absolute.b.x-o->Absolute.a.x)/2-10, o->Absolute.a.y+(o->Absolute.b.y-o->Absolute.a.y)/2-10, o->Absolute.a.x+(o->Absolute.b.x-o->Absolute.a.x)/2+10, o->Absolute.a.y+(o->Absolute.b.y-o->Absolute.a.y)/2+10, makecol(255,5,5));
}

/**
*	Fade effect
*/
l_int Fade = 0;

_PUBLIC void  FadeEffectDraw ( PWidget o, p_bitmap buffer, PRect w )
{
	rectfill(buffer, o->Absolute.a.x, o->Absolute.a.y, o->Absolute.b.x, o->Absolute.b.y, makecol(Fade, Fade*2, Fade));
}

_PUBLIC void  FadeEffect ( void )
{
	WIDGET(Laby)->Draw = &FadeEffectDraw;

	while (Fade < 100)
	{
		WidgetDraw(WIDGET(Laby), NULL);

		ThreadTimerWait(10);

		Fade++;
	}

	while (Fade > 0)
	{
		WidgetDraw(WIDGET(Laby), NULL);

		ThreadTimerWait(10);

		Fade--;
	}

	WIDGET(Laby)->Draw = &GameDraw;

	WidgetDraw(WIDGET(Laby), NULL);
}

_PUBLIC void  NextLevel ( void )
{
	WhereX = 1; WhereY = 1;

	FadeEffect();
}

_PUBLIC void  UpdateMove ( void )
{
	if (MapDAT[WhereX][WhereY] == 2)
	{
		MessageBox(&Me, "Winner!", "Congratulations, you have found the exit!\n\nProceed to the next level...", MBB_OK);
		NextLevel();
	}

	WidgetDraw(WIDGET(Laby), NULL);
}

l_bool GameEH(PWidget o, PEvent Event)
{
	if (Event->Type == EV_KEYBOARD)
	{
		if (SCANCODE(Event, KEY_RIGHT))
		{
			if (MapDAT[WhereX + 1][WhereY] != 0)
			{
				WhereX++;
				UpdateMove();
			}

			return true;
		}

		if (SCANCODE(Event, KEY_LEFT))
		{  // arrow LEFT was pressed
			if (MapDAT[WhereX - 1][WhereY] != 0)
			{
				WhereX--;
				UpdateMove();
			}

			return true;
		}

		if (SCANCODE(Event, KEY_DOWN))
		{  // arrow DOWN was pressed
			if (MapDAT[WhereX][WhereY + 1] != 0)
			{
				WhereY++;
				UpdateMove();
			}

			return true;
		}

		if (SCANCODE(Event, KEY_UP))
		{  //arrow UP was pressed
			if (MapDAT[WhereX][WhereY - 1] != 0)
				{
					WhereY--;
					UpdateMove();
				}

			return true;
		}
	}

	return false;
}


l_bool AppEventHandler ( PWidget o, PEvent Event )
{
	if ( Event->Type == EV_MESSAGE )
	{
		switch ( Event->Message )
		{
			case WM_CLOSE:
			{
				WidgetDispose(WIDGET(o));
				CloseApp(&Me);
				return true;
			}
			break;

			case WM_ABOUT:
			{
				MessageBox(&Me, "About Laby", "Laby 1.0\n\nAuthor: Lukas Lipka\n\nCopyright (c) 2003-2004 Lukas Lipka. All rights reserved.", MBB_OK);
				return true;
			}
			break;
		}
	}

	return false;
}


l_int Main ( int argc, l_text *argv )
{
	PWindow w	= 0;
	TRect r;

	RectAssign(&r,0, 0, 190, 160);
	w = CreateWindow(&Me, r, "Laby", WF_CAPTION|WF_FRAME|WF_CENTERED|WF_MINIMIZE);
	InsertWidget(WIDGET(DeskTop), WIDGET(w));
	WidgetPreCenter(WIDGET(w));

	RectAssign(&r, 0, 0, 190, 160);
	Laby = CreateCanvas(&Me, r);
	WIDGET(Laby)->Draw = &GameDraw;
	WIDGET(Laby)->EventHandler = &GameEH;
	WIDGET(Laby)->Flags |= WFFocusable;
	WIDGET(Laby)->Flags |= WFForceBuffer;
	InsertWidget(WIDGET(w), WIDGET(Laby));

	WidgetDrawAll(WIDGET(w));

	WidgetSetFocus(WIDGET(Laby));

	WIDGET(w)->AppEvHdl = &AppEventHandler;
	return true;
}

void Close (void)
{

}
