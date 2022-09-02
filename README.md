# inno_setup_script

inno_setup_script is a template script as a start up for Inno Setup free installer for Windows.

Inno Setup Scripts are arranged into sections. Each section controls a different aspect of the installation. A section is started by specifying the name of the section enclosed in square brackets []. Inside each section is any number of entries.

The Pascal scripting feature (modern Delphi-like Pascal) adds lots of new possibilities to customize your Setup or Uninstall at run-time.

# Features
 - package.iss
    
    Main script file.
 - ipaddress.iss 
    
    additioanal pascal script file to create a page to change ip address. You may need to reconsider if you add a custom page to your installation file.
    
