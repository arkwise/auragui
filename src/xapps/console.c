////////////////////////////////////////////////////////////////////////////////
//
//	Console
//
//	Copyright (c) 2004 Point Mad. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////
#include "kernel.h"
#include "console.h"
#include "debug.h"

l_ulong AppVersion	= ULONG_ID(0,0,1,0);
char AppName[]		= "console";
l_uid NeededLibs[] = { "conlib","" };


l_text _ResolveFileName ( l_text File ) {
	
	l_text 	t = File, // Current char 
			l = NULL, // Last token
			c = File; // Current token
			
	do {
		if ( (*t == '/') || !*t ) {
			/*if ( !(t-c) && l ) {
				l_text n = TextDup(t);
				free(File);
				return _ResolveFileName(n);
			} else */if ( !TextSqNCaseCompare(c,"..",t-c) ) {
				if ( l ) {
					l_text n = TextDup(File);
					TextCopy(n+(l-File),n+(t+(*t?1:0)-File));
					free(File);
					return _ResolveFileName(n);
				} else {
					l_text n = TextDup(File);
					TextCopy(n+(c-File),n+(t+(*t?1:0)-File));
					free(File);
					return _ResolveFileName(n);
				}
			} else if ( !TextSqNCaseCompare(c,".",t-c) ) {
				l_text n = TextDup(File);
				TextCopy(n+(c-File),n+(t+(*t?1:0)-File));
				free(File);
				return _ResolveFileName(n);
			}
			
			if ( t != File ) l = c;
			c = t+1;
		}
		
		//t++;	
	} while ( *(t++) );	
	return File;
}
////////////////////////////////////////////////////////////////////////////////
l_text ResolveFileName ( l_text File ) {

	return _ResolveFileName(TextDup(File));

}
////////////////////////////////////////////////////////////////////////////////
l_int Main( int arc, l_text *arv )
{

	l_text a;
	l_text CurrentDir =  TextDup("/system");
	
	l_text 	*argv;
	l_int 	argc;
	
	DebugMessage("starting printf.....\n");
	Printf(&Me,"%s %d.%d.%d.%d\n%s\n\nConsole %d.%d.%d.%d\n",
	SystemApp.Name,
	ULID_A(SystemApp.Version),ULID_B(SystemApp.Version),
	ULID_C(SystemApp.Version),ULID_D(SystemApp.Version),
	KernelCopyright,
	ULID_A(Me.Version),ULID_B(Me.Version),
	ULID_C(Me.Version),ULID_D(Me.Version));

	Printf(&Me,"\n");
	do {
		Printf(&Me,"%s>",CurrentDir);
		a = Prompt(&Me);
		_ParseArgs(a,NULL,&argc,&argv);
		Printf(&Me,"\n");
		if ( argc ) {
		
			if ( !TextCaseCompare(argv[0],"exit") ) {
				
				
				return false;	
			} else if ( !TextCaseCompare(argv[0],"cd") ) {
				
				if ( argc != 2 ) {
					Printf(&Me,"Syntax : CD <path>\n");
				} else {
					l_text np,r;
					PFileInfo i;
					
					if ( *argv[1] == '/' )
						r = TextDup(argv[1]);
					else {
						np = FileNameToPath(CurrentDir,argv[1]);
						r = ResolveFileName(np);
						free(np);
					}
					
					i = FileGetInfo(r);
					
					if ( i ) {
						free(CurrentDir);
						CurrentDir = TextDup(r);
						FreeFileInfo(i);
					} else {
						
						Printf(&Me,"\nUnknow directory : %s\n\n",r);
						
					}
					
					
					free(r);
				}
			} else if ( !TextCaseCompare(argv[0],"dir") ) {
				
				PList l = ListDir(CurrentDir,FA_DIREC|FA_LABEL);
				PListItem a, b;
				
				
				Printf(&Me,"\nListing of %s\n\n",CurrentDir);
				
				if ( l->Last ) {
					a = b = l->Last->Next;
					l_ulong n = 0;
					do
					{
						if ( FILEINFO(a->Data)->Attributes & FA_DIREC )
							Printf(&Me,"[dir]");
						else
							Printf(&Me,"     ");
						
						Printf(&Me,"%s\n",FILEINFO(a->Data)->Name);
						n++;
						a = a->Next;
					}
					while ( a != b );
					Printf(&Me,"\nTotal : %d files and directories\n\n",n);

				} else {
					
					Printf(&Me,"no files\n\n");
				}
				
			} else {
				
				l_text np,r;
				PFileInfo i;
				
				if ( *argv[0] == '/' )
					r = TextDup(argv[0]);
				else {
					np = FileNameToPath(CurrentDir,argv[0]);
					r = ResolveFileName(np);
					free(np);
				}

				i = FileGetInfo(r);
				
				if ( i ) {
					
					RunFile3(i,argc-1,&argv[1],&Me,NULL);
					FreeFileInfo(i);
				} else {
					Printf(&Me,"\n'%s' : Unknown command\n\n",argv[0]);
				}
				free(r);
				
			}
		
		}
		
		FreeArgs(argc,argv);
		free(a);
	} while ( 1 );
	
	FreeArgs(argc,argv);
	free(a);
	
	return false;
}
////////////////////////////////////////////////////////////////////////////////
void Close(void)
{

}
////////////////////////////////////////////////////////////////////////////////
