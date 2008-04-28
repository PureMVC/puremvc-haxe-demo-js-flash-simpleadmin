PureMVC haXe Demo -  JavaScript / Flash Simple Admin
By Marco Secchi <marco.secchi@puremvc.org>
Copyright(c) 2008 Marco Secchi, Some rights reserved.
--------------------------------------------------------------------------
This example demonstates how to write the same pureMVC application for multiple platforms. Being so "abstract" in its form, pureMVC lets you to write code which is reusable for js/flash/neko easily.

What's different is the way you create and control view components. This is easily obtained through haxe conditional compilation. You can see how this in the StartupCommand class where the various uis are created or in the mediators & uis where they are managed.

Whith haXe you can also create your own flags (yes, that's right, multiplatform also means "for mobile")

For more info on conditional compilation, read:
http://haxe.org/ref#conditional_compilation