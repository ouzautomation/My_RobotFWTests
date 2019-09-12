*** Settings ***
Library    SeleniumLibrary  
Library    Collections    
library    OperatingSystem    
library    Dialogs    



*** Variable ***
${url_radar}    http://rec-radar.orange-sonatel.com:8080

${urldev_radar}    http://dev-radar.orange-sonatel.com:8080
    
*** Test Cases ***
#Test quelques fonctions
   
 CreationListe 
    @{list} =    Create List        a    b    c    d 
    Log        ${list} 
    ${tmp} =    Get From List    ${list}        2 
    Log        ${tmp} 

CreationDict 
    &{dict} =    Create Dictionary    a    1    b    2   c   5   h   10
    Log        ${dict} 
    ${tmp} =    Get From Dictionary        ${dict}        h    
    Log        ${tmp}
    Get File Size    /Users/sane028711/eclipse-workspace/Radar/radar_verif.robot
    Execute Manual Step    voulez-vous continuer
    Create File    /Users/sane028711/eclipse-workspace/Radar/radar_verif2.robot
    Get File Size    /Users/sane028711/eclipse-workspace/Radar/radar_verif2.robot
    Copy File    /Users/sane028711/eclipse-workspace/Radar/radar_verif.robot   /Users/sane028711/eclipse-workspace/Radar/radar_verif2.robot
    Get File Size    /Users/sane028711/eclipse-workspace/Radar/radar_verif2.robot
    Remove File    /Users/sane028711/eclipse-workspace/Radar/radar_verif2.robot
    Get File    /Users/sane028711/eclipse-workspace/Radar/radar_verif.robot
  
 

000_Authentification
    [Documentation]    connexion à l'Application
   
   AUTHENTIFICATION
   Close Browser
   

001_Liste des regles
    [Documentation]   La liste des Règles
   VERIF_REGLE
   

   
003_Lister les alarmes 
    [Documentation]   La liste des alarmes et la consultation d'une
    AFFICHER_ALARME_CONSULTER_ALARME
    

    
004_L'affichage des boutons d'action, de réassignation et d'export en fonction des statuts et de l'assignation des alarmes
    [Documentation]   Affichage des boutons d'action à l'assignation des alarmes
  RECHERCHE_ALARME_SATUT
  


  
005_La réassignation depuis la page de liste des alarmes en prenant en compte les statuts des alarmes
    [Documentation]   La reassignation depuis la page dd liste des alarmes
    REASSIGNATION_ALARME_DEPUIS ALARMES
    

    
007.1_La verification de l’export en appliquant un filtre/ en cochant une ou des alarmes/ en combinant les deux
    [Documentation]    La verification de l'export en appliquant les filtres
    VERIF_EXPORT_ALARME
    



007.2_La verification de l’export en appliquant un filtre/ en cochant une ou des alarmes/ en combinant les deux_2
    [Documentation]    La verification de l'export en appliquant les filtres
    VERIF_EXPORT_FILTRE_STATUT_ALARME
    

    

007.3_La verification de l’export en appliquant un filtre/ en cochant une ou des alarmes/ en combinant les deux_3
    [Documentation]    La verification de l'export en appliquant les filtres
    VERIF_EXPORT_FILTRE_STATUT_ALARME_COMBINEE
    



008-La verification du compteur des alertes dans la liste des alarmes et le nombre réel d'alerte à la consul_alarme
    [Documentation]   La verification du compteur des alertes dans la liste des alarmes
    VERIF_COMPT_ALERTE_DANS_ALRM
 

   
   
009_ La consultation d'une alarme
    [Documentation]   La consultation d'une alarme 
    CONSULTER_ALARME
    Close Browser
    



012-013_La consultation d'une alerte avec verification colonnes
    [Documentation]   La consultation d'une alerte avec la vérification des colonnes
    CONSULTATION_ALERTE
    




010_La réassignation d'une alarme depuis la page de consultation en prenant en compte les statuts des alarmes
    [Documentation]   la reassignation d'une alarme depuis la consultation
    REASSIGNATION_ALARME
    



   

    
*** Keywords ***
AUTHENTIFICATION
    Open Browser       ${url_radar}     safari
    Maximize Browser Window
    Sleep    2 
    Input Text    id=username   admin
    Input Password    id=password   admin
    Click Button    id=kc-login 
    Sleep  2
    
    
CONSULTATION_ALERTE
    AUTHENTIFICATION
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[3]/a/span/span
    Sleep  2
    # verif des colonnes des alertes
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/thead/tr/th[2]/span/span
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/thead/tr/th[3]/span/span
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/thead/tr/th[4]/span/span
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/thead/tr/th[5]/span/span
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/thead/tr/th[6]/span/span
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/thead/tr/th[7]/span/span
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/thead/tr/th[8]/span/span
    #On scrole vers le bas
    Sleep  2
    Execute Javascript   window.scrollTo(1239,4777)
    Sleep  2
    Execute Javascript   window.scrollTo(1239,4777)
    Sleep  2
    Execute Javascript   window.scrollTo(1239,4777)
    # consulter une alerte
    Click Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte/div/div[3]/div/div/div/div/table/tbody/tr[1]/td[2]
    Sleep  2
    # Recherche de Alert_
    Page Should Contain    Alert_
    Sleep  2
    Close Browser
    
VERIF_REGLE
    AUTHENTIFICATION
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[2]/a/span/span
    Sleep   3
    # bouton creer regle
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-regle/div/div[1]/div/div/div/a/span/span
    # les filtres
    Page Should Contain Element    xpath=//*[@id="filtre"]/div[1]/angular2-multiselect/div/div[1]/div
    Page Should Contain Element    xpath=//*[@id="filtre"]/div[2]/angular2-multiselect/div/div[1]/div
    Page Should Contain Element    xpath=//*[@id="filtre"]/div[3]/angular2-multiselect/div/div[1]/div
    #//*[@id="dropdownImpact"]/span[1]
    #//*[@id="filtre"]/div[1]/angular2-multiselect/div/div[1]/div
    #//*[@id="dropdownImpact"]
    # Page Should Contain Element    xpath=//*[@id="filtre"]/div[4]/angular2-multiselect/div/div[1]/div
    Page Should Contain Element    xpath=//*[@id="dropdownImpact"]/span[1]
    Page Should Contain Element    xpath=//*[@id="filtre"]/div[5]/angular2-multiselect/div/div[1]/div
    Page Should Contain Element    xpath=//*[@id="filtre"]/div[6]/angular2-multiselect/div/div[1]/div
    #bouton activer /desactiver
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/tbody/tr[1]/td[9]/div/div/label
    Sleep  2
    # les colonnes
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[2]
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[3]
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[4]
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[5]
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[6]
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[7]
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[8]
    Page Should Contain Element    xpath=//*[@id="regles_tab_info"]/thead/tr/th[9]
    Close Browser
    
AFFICHER_ALARME_CONSULTER_ALARME
    AUTHENTIFICATION
    # ALARMES PUIS  ALARMES (INTERNE)
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    #verification sous menu
    Page Should Contain Element    xpath=//*[@id="allAlarmes"]/a/span
    Page Should Contain Element    xpath=//*[@id="myAlarmes"]/a/span
    Page Should Contain Element    xpath=//*[@id="closedAlarms"]/a/span
    #verification filtres
    Sleep  2
    Page Should Contain Element    xpath=//*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[1]/div
    #Page Should Contain Element    xpath=//*[@id="filtre"]/div[1]/angular2-multiselect/div/div[1]/div
    Page Should Contain Element    xpath=//*[@id="dropdownImpact"]
    Sleep  2
    # le troisieme     Page Should Contain Checkbox    xpath=//*[@id="dropdownImpact"]
    # le quatrieme  Page Should Contain Element     xpath=//*[@id="dropdownImpact"]
 
    Page Should Contain Element     xpath=//*[@id="dropdownImpact"]/span[1]
    Page Should Contain Element     xpath=//*[@id="dropdownAlertCount"]
    
    Page Should Contain Element     xpath=//*[@id="filtre"]/div[1]/div[5]/angular2-multiselect/div/div[1]/div
    
    #Page Should Contain Element    xpath=//*[@id="filtre"]/div[3]/angular2-multiselect/div/div[1]/div   
    #Page Should Contain Element    xpath=//*[@id="filtre"]/div[4]/angular2-multiselect/div/div[1]/div
    #Page Should Contain Element    xpath=//*[@id="filtre"]/div[5]/angular2-multiselect/div/div[1]/div
    #Page Should Contain Element    xpath=//*[@id="filtre"]/div[6]/angular2-multiselect/div/div[1]/div
    #Page Should Contain Element    xpath=//*[@id="filtre"]/div[7]/angular2-multiselect/div/div[1]/div
    #présence bouton reset et filter
    Page Should Contain Element    xpath=//*[@id="serchToolButton"]/a[1]
    Page Should Contain Element    xpath=//*[@id="serchToolButton"]/a[2]
    Sleep   2
    # liste collones alarmes
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[3]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[4]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[5]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[6]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[7]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[8]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[9]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[10]/span
    Page Should Contain Element    xpath=//*[@id="table-alarm"]/thead/tr/th[11]/span
    Sleep  2
    #la partie consulter alarme
    Click Element    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[3]
    Page Should Contain    _
    Sleep   2
    Click Element     xpath=//*[@id="assigned-to"]/option[6]
    Close Browser
    

CONSULTER_ALARME
    AUTHENTIFICATION
    
    # ALARMES PUIS  ALARMES (INTERNE)
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep  2
    Click Element    xpath=//*[@id="table-alarm"]/tbody/tr[2]/td[3]
    Sleep  4 
    # verifier si la page contient le bouton d'assignation
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[1]
    # verifier le bouton export
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]
    #verifcation des détails de l'alarme
    Page Should Contain Element      xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[2]/div/div/div/div/table/tbody/tr[1]/th
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[2]/div/div/div/div/table/tbody/tr[2]/th
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[2]/div/div/div/div/table/tbody/tr[4]/th
    # verification des details du client, historique .....
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[3]/div[1]/div[1]/div/div
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[2]/div/div/div/h3
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[3]/div[2]/div/h3
    Sleep   2
    #Click Element     xpath=//*[@id="action-select"]/div
    #Select Checkbox    id=assigned-to 
        #Click Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[1]
  
   #Click Element     xpath=//*[@id="assigned-to"]/option[6]

   # Ne pas fermer le navigateur car un autre kryword l'appelle            
    
VERIF_EXPORT_ALARME
    AUTHENTIFICATION
    # ALARMES PUIS  ALARMES (INTERNE)
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element   xpath=//*[@id="table-alarm"]/tbody/tr[2]/td[2]/span/label
    Sleep   3
 
  #****************#
    #VERFIF ET CLICK SUR LE BUTTON
    # PROBLEME BOUTTON QUI NE SAFFICHE PAS
    #Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/button
    #Click Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/button
    Close Browser
          
 

VERIF_EXPORT_FILTRE_STATUT_ALARME
    AUTHENTIFICATION
    # ALARMES PUIS  ALARMES (INTERNE)
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    # click sur statut
    Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
    Sleep   1
    # cocher la case NEW
    
    Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[1]
    Sleep   2
    # Clicker sur filter
    
    Click Element    xpath=//*[@id="serchToolButton"]/a[2]
    Sleep    2
    #****************#
    
    # PROBLEME BOUTTON QUI NE SAFFICHE PAS
    #Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/button
    #Click Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/button
    Close Browser
    
VERIF_EXPORT_FILTRE_STATUT_ALARME_COMBINEE
    AUTHENTIFICATION
     # ALARMES PUIS  ALARMES (INTERNE)
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
    Sleep   1
    # cocher la case NEW
    Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[1]
    Sleep   2
    # Clicker sur filter
    Click Element    xpath=//*[@id="serchToolButton"]/a[2]
    Sleep    2
    # PROBLEME BOUTTON QUI NE SAFFICHE PAS
    #Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/button
    # cocher un element parmi les elements filtre
    Click Element    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[2]
    #cliquer sur export
    #Click Element    xpath=Click Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/button
    
    Close Browser
    
VERIF_COMPT_ALERTE_DANS_ALRM
    AUTHENTIFICATION
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    #recherche d'une alarme
    Input Text    xpath=//*[@id="orange-navbar-collapse"]/ul/li[7]/div/li[1]/div/form/input   Alarm_772009208
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[7]/div/li[1]/div/form/button
    Sleep  2
    #Assign Id To Element    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[9]   nbr_alertes
    # je stocke le nombre dans nb
    ${nb}   Get Text    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[9]
    # je l'affiche juste pour vérifier si j'ai la bonne valeur
    log  ${nb} 
    #je me rends à la deuxieme page
    Click Element    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[3]
    sleep   2   
    # on cherche si ce nombre stocké est bien présent dans la page courante 
    Element Should Contain    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[2]/div/div/div/div/table/tbody/tr[7]/td    ${nb}   
    Close Browser
    
REASSIGNATION_ALARME
    CONSULTER_ALARME
    Sleep  2
    Click Element     xpath=//*[@id="assigned-to"]/option[12]
    Reload Page
    ${assignUser}    Get Text     xpath=//*[@id="assigned-to"]/option[12]
    Log   ${assignUser}
    Page Should Contain    ${assignUser}
    #Element Should Contain    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[2]/div/div/div/div/table/tbody/tr[10]/td/span   ${assignUser}    
    Close Browser
    
RECHERCHE_ALARME_SATUT
    AUTHENTIFICATION
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    @{Stat}    Create List   INV    NEW   PEN
     :FOR    ${Item}    IN    @{Stat}
  \   #Click sur statut
  \   Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
  \   # insérer text dans l’espace de recherche
  \   Run Keyword If   '${Item}'=='@{Stat}[0]'       Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    @{Stat}[0]
  \   Sleep  2 
  # cocher le statut qui est sélectionné
  \  Click Element  xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
  \  #cliquer sur filtre /span
  \  Click Element  xpath=//*[@id="serchToolButton"]/a[2]
  \    Sleep   2
  \  #cocher le premier element  oubien  //*[@id="table-alarm"]/tbody/tr[1]/td[2]
  \  Click Element  xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[2]/span/label
  \  #verifier si des boutons apparaissent
  \  Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]    
  \  # désélectionner le statut choisi en cours
  \  Click Element   xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/div/div/span[2]
  \  #Cliquer sur filtre pour tout restaurer avant la prochaine itération  /span
  \   Click Element   xpath=//*[@id="serchToolButton"]/a[2]   
  \   #Click sur statut
  \   Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
  \   # insérer text dans l’espace de recherche
  \   Run Keyword If   '${Item}'=='@{Stat}[1]'       Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    @{Stat}[1]
  \   Sleep  2 
  # cocher le statut qui est sélectionné
  \  Click Element  xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
  \  #cliquer sur filtre /span
  \  Click Element  xpath=//*[@id="serchToolButton"]/a[2]
  \    Sleep  2
  \  #cocher le premier element  oubien  //*[@id="table-alarm"]/tbody/tr[1]/td[2]
  \  Click Element  xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[2]/span/label
  \  #verifier si des boutons apparaissent
  \  Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]    
  \  # désélectionner le statut choisi en cours
  \  Click Element   xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/div/div/span[2]
  \  #Cliquer sur filtre pour tout restaurer avant la prochaine itération  /span
  \   Click Element   xpath=//*[@id="serchToolButton"]/a[2]
  \   #Click sur statut
  \   Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
  \   # insérer text dans l’espace de recherche
  \   Run Keyword If   '${Item}'=='@{Stat}[2]'       Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    @{Stat}[2]
  \   Sleep  2 
  # cocher le statut qui est sélectionné
  \  Click Element  xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
  \  #cliquer sur filtre /span
  \  Click Element  xpath=//*[@id="serchToolButton"]/a[2]
  \    Sleep  2
  \  #cocher le premier element  oubien  //*[@id="table-alarm"]/tbody/tr[1]/td[2]
  \  Click Element  xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[2]/span/label
  \  #verifier si des boutons apparaissent
  \  Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]    
  \  # désélectionner le statut choisi en cours
  \  Click Element   xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/div/div/span[2]
  \  #Cliquer sur filtre pour tout restaurer avant la prochaine itération  /span
  \  Click Element   xpath=//*[@id="serchToolButton"]/a[2]
     
    Close Browser
    
REASSIGNATION_ALARME_DEPUIS ALARMES
    AUTHENTIFICATION
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    @{Stat}    Create List   INV    NEW   PEN
     :FOR    ${Item}    IN    @{Stat}
  \   #Click sur statut
  \   Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
  \   # insérer text dans l’espace de recherche
  \   Run Keyword If   '${Item}'=='@{Stat}[0]'       Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    @{Stat}[0]
  \   Sleep  2 
  \  # cocher le statut qui est sélectionné
  \  Click Element  xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
  \  #cliquer sur filtre /span
  \  Click Element  xpath=//*[@id="serchToolButton"]/a[2]
  \  #cocher le premier element  oubien  //*[@id="table-alarm"]/tbody/tr[1]/td[2]
  \  Click Element  xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[2]/span/label
  \  #verifier si des boutons apparaissent
  \  Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]    
  \  Sleep  2
  \  #cliquer deux fois sur le bouton de selection des users
  \  #Click Element    xpath=//*[@id="assigned-to"]
  \  #Sleep  2 
  \  #Click Element    xpath=//*[@id="assigned-to"] 
  \  #choisir un user
  \  Click Element    xpath=//*[@id="assigned-to"]/option[4]
  \  Sleep   2  
  \  #verifier que le choix est fait 
  \  ${reassignUser}    Get Text     xpath=//*[@id="assigned-to"]/option[12]
  \  Element Should Contain    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[10]   ${reassignUser}    
  \  # désélectionner le statut choisi en cours
  \  Click Element   xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/div/div/span[2]
  \  #Cliquer sur filtre pour tout restaurer avant la prochaine itération  /span
  \  Click Element   xpath=//*[@id="serchToolButton"]/a[2]   
  \  #Click sur statut
  \  Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
  \  # insérer text dans l’espace de recherche
  \  Run Keyword If   '${Item}'=='@{Stat}[1]'       Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    @{Stat}[1]
  \  Sleep  2 
  \  # cocher le statut qui est sélectionné
  \  Click Element  xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
  \  #cliquer sur filtre /span
  \  Click Element  xpath=//*[@id="serchToolButton"]/a[2]
  \  #cocher le premier element  oubien  //*[@id="table-alarm"]/tbody/tr[1]/td[2]
  \  Click Element  xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[2]/span/label
  \  #verifier si des boutons apparaissent
  \  Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]    
  \   #cliquer deux fois sur le bouton de selection des users
  \  Sleep  2
  \  #Click Element    xpath=//*[@id="assigned-to"]
  \  #Sleep  2 
  \  #Click Element    xpath=//*[@id="assigned-to"] 
  \  #choisir un user
  \  Click Element    xpath=//*[@id="assigned-to"]/option[4]
  \  Sleep   2  
  \  #verifier que le choix est fait 
  \  ${reassignUser}    Get Text     xpath=//*[@id="assigned-to"]/option[12]
  \  Element Should Contain    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[10]   ${reassignUser}    
  \  # désélectionner le statut choisi en cours
  \  Click Element   xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/div/div/span[2]
  \  #Cliquer sur filtre pour tout restaurer avant la prochaine itération  /span
  \  Click Element   xpath=//*[@id="serchToolButton"]/a[2]
  \  #Click sur statut
  \  Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
  \  # insérer text dans l’espace de recherche
  \  Run Keyword If   '${Item}'=='@{Stat}[2]'       Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    @{Stat}[2]
  \  Sleep  2 
  \  # cocher le statut qui est sélectionné
  \  Click Element  xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
  \  #cliquer sur filtre /span
  \  Click Element  xpath=//*[@id="serchToolButton"]/a[2]
  \  #cocher le premier element  oubien  //*[@id="table-alarm"]/tbody/tr[1]/td[2]
  \  Click Element  xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[2]/span/label
  \  #verifier si des boutons apparaissent
  \  Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]    
  \  #cliquer deux fois sur le bouton de selection des users
  \  Sleep  2
  \  #Click Element    xpath=//*[@id="assigned-to"]
  \  #Sleep  2 
  \  #Click Element    xpath=//*[@id="assigned-to"] 
  \  #choisir un user
  \  Click Element    xpath=//*[@id="assigned-to"]/option[4]
  \  Sleep   2  
  \    #verifier que le choix est fait 
  \  ${reassignUser}    Get Text     xpath=//*[@id="assigned-to"]/option[12]
  \  Element Should Contain    xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[10]   ${reassignUser}    
  \  # désélectionner le statut choisi en cours
  \  Click Element   xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/div/div/span[2]
  \  #Cliquer sur filtre pour tout restaurer avant la prochaine itération  /span
  \  Click Element   xpath=//*[@id="serchToolButton"]/a[2]
     
     Close Browser
     
       
VERIFICATION_WORKFLOWS
    AUTHENTIFICATION
    # ALARMES PUIS  ALARMES (INTERNE)
    Click Element    xpath=//*[@id="alarmsNavBarDropdown"]/span/span
    Click Element    xpath=//*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep  2     
    #Cliquer sur Statut
    Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div
    #cocher NEW en le selectionnant
    Click Element    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[1]
    #cliquer sur filtre /span
    Click Element  xpath=//*[@id="serchToolButton"]/a[2]
    
    
    
    
    
    

    
