#include <EGL/egl.h>    // EGL library
#include <EGL/eglext.h> // EGL extensions

#include "SexyAppBase.h"
#include "graphics/GLInterface.h"
#include "graphics/GLImage.h"
#include "widget/WidgetManager.h"

using namespace Sexy;

void SexyAppBase::MakeWindow()
{
	if (mWindow)
	{
		
	}
	else
	{
		
	}

	if (mGLInterface == NULL)
	{
		mGLInterface = new GLInterface(this);
		InitGLInterface();
	}

	bool isActive = mActive;
	mActive = true;

	mPhysMinimized = false;
	
	if (isActive != mActive)
		RehupFocus();

	ReInitImages();

	mWidgetManager->mImage = mGLInterface->GetScreenImage();
	mWidgetManager->MarkAllDirty();
}