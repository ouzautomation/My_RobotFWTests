*** Settings ***
Library    SeleniumLibrary    
*** Test Cases ***
Test1
   # senario du test1 : aller a la page orange.sn et cliquez sur espace client pour ensuite 
   # se logguer avec de faux params
    Open Browser       https://espaceclient.orange.sn     chrome
    Sleep    2 
    ##Open Browser  https://orange.sn     chrome
    # mettre ici l'acces a espace client
    #Click Button        class=btn btn-warning
    Input Text        name=login   moussa
    Input Password    name=pwd     12345
    Click Button      name=envoyer
    Page Should Contain    Mot de passe incorrect   
    Sleep    3
    Log     utilisateur inexistant
    Close Browser
Test2
    # senario du test2  : rester sur la page et faire une connexion aves des parametres valides 
    Open Browser      https://espaceclient.orange.sn     chrome
    Input Text        name=login   774590750
    Input Password    name=pwd     ousinpwd7531
    Click Button      name=envoyer
    Page Should Contain    Fichier du client    
    sleep    3
    Close Browser