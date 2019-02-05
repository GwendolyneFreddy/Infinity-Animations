# <a name="top" id="top"></a>Infinity Animations

### Un mod de Spellhold Studios pour Baldur's Gate II : <acronym title="Throne of Bhaal">ToB</acronym>, Baldur's Gate Trilogy et <acronym title="Baldur's Gate 'To Two'">Tutu</acronym>


<strong>Auteure :</strong> Erephine<br />
<strong>Code <acronym title="Weimer Dialogue Utility">WeiDU</acronym> :</strong> Miloch<br />
<strong>Version :</strong> 6.0.1 alpha<br />
<strong>Langues :</strong> <a href="README.md">anglais</a>, fran�ais<br />
<strong>Platformes :</strong> Windows, linux

<strong>Site internet du mod :</strong> <a href="http://www.spellholdstudios.net/ie/infinityanimations">Spellhold Studios</a><br />
<strong>Forum du mod :</strong> <a href="http://www.shsforums.net/forum/594-infinity-animations/">Infinity Animations</a>


<center><a href="#intro">Pr�sentation</a> &#x2B25; <a href="#compat">Compatibilit�</a> &#x2B25; <a href="#installation">Installation</a> &#x2B25; <a href="#compon">Composants</a> &#x2B25; <a href="#anims">Animations</a> &#x2B25; <a href="#credits">Cr�dits</a> &#x2B25; <a href="#version">Hostorique</a></center></br></br>


<hr>


## <a name="intro" id="intro"></a>Pr�sentation

Ce mod modifie le jeu Baldur's Gate II : Tr�ne de Bhaal de fa�on � ce qu'il dispose d'animations suppl�mentaires de cr�atures et de personnages (appel�es � slots d'animation � dans ce document [<em>NdT : � emplacements � ou � index �</em>]). Il fournit aussi un utilitaire permettant de d�finir automatiquement de nouveaux slots d'animation afin de les enregistrer dans le forum d'Infinity Animations. Il fonctionne ainsi comme une base de donn�es centralis�e, utilisable par quiconque souhaite ajouter de nouvelles animations de cr�ature dans le jeu sans �tre confront� � des probl�mes de conflits et d'incompatibilit� avec d'autres mods.

Infinity Animations prend en charge les types d'animation tr�s divers des jeux Baldur's Gate I, Baldur's Gate II, Icewind Dale I, Icewind Dale II, Planescape: Torment et Neverwinter Nights. En bonus, le mod r�tablit l'int�gralit� des animations de personnages de Baldur's Gate I, et permet � certaines animations qui n'en avaient pas jusqu'� pr�sent de disposer dor�navant d'un paperdoll [<em>NdT : silhouette dans l'�cran des personnages</em>].
Point important pour les joueurs installant plusieurs mods cons�quents (appel�s � megamods �), Infinity Animations r�sout les conflits de slots d'animation [<em>NdT : plusieurs mods utilisant les m�mes slots pour des animations diff�rentes, le dernier install� �crase les modifications effectu�es par les pr�c�dents</em>], et r�tablit les animations de base que les megamods ont modifi�es.

Enfin, il comporte des composants optionnels qui introduisent de nombreuses nouvelles animations dans le jeu, ainsi que leurs jeux de sons associ�s (soundsets). Bien que le nombre d'animations support�es ne soit pas � infini �, comme le nom du mod l'indique, il devrait toutefois �tre assez important pour r�pondre aux besoins actuels (et probablement futurs) de tout le monde.

<strong>Principales fonctions</strong>
<ul style="margin-left: 4%;">
	<li>R�tablit les animations de personnages de Baldur's Gate I.</li>
	<li>Am�liore la prise en charge des paperdolls pour les animations existantes.</li>
	<li>Ajoute des animations de jeu personnalis�es pour les personnages et les cr�atures (dont les dragons).</li>
	<li>Permet d'utiliser de nombreux <em>types</em> d'animation (dont certains n'ont jamais �t� vus dans les jeux).</li>
	<li>R�sout les probl�mes d'empilement d'animation et les conflits de slots et de d�signation des animations.</li>
	<li>Fournit un utilitaire <acronym title="Graphical User Interface">GUI</acronym> [<em>NdT : interface graphique</em>] pour vous aider � ajouter de nouvelles animations dans le jeu.</li>
	<li>Vous permet de visualiser � quel point le pourcentage de slots d'animation disponibles refuse obstin�ment de diminuer. &#128578;</li>
</ul>
<div style="text-align:right"><a href="#components">Retour en haut de page</a></div>


<hr>


## <a name="compat" id="compat"></a>Compatibilit�

Infinity Animations fonctionne avec <acronym title="Baldur's Gate II">BG2</acronym> : Tr�ne de Bhaal et toutes les conversions  bas�es sur <acronym title="Throne of Bhaal">ToB</acronym>. <strong>Assurez-vous que vous avez bien install� le patch 26498 pour le Tr�ne de Bhaal.</strong> Si n�cessaire, v�rifiez le fichier Readme relatif au patch dans votre r�pertoire de jeu et sur le site internet de <a href="http://www.bioware.com/games/throne_bhaal/support/patches/">BioWare</a>.

Ce mod est �galement compatible avec les autres mods, dont <a href="http://www.pocketplane.net/tutu/">Baldur's Gate Tutu</a> (et EasyTutu), <a href="http://www.shsforums.net/index.php?showforum=261">Baldur's Gate Trilogy</a> et le <a href="http://www.shsforums.net/files/file/536-big-world-installpack/">BiG World Project</a>.

Installez-le apr�s la plupart des autres mods, en particulier ceux qui ajoutent des cr�atures ou des animations, mais avant les proc�dures finales de � biffing �. [<em>NdT : archivage avec Generalized biffing</em>]

Commencez une nouvelle partie</strong> apr�s avoir install� ce mod, ou si vous �tes r�ticent(e), installez le composant � Correction des animations dans les parties sauvegard�es �.</br>
<div style="text-align:right"><a href="#components">Retour en haut de page</a></div>

		
## <a name="installation" id="installation"></a>Installation

#### Mise en garde

<em>Si une ancienne version de ce mod est d�j� install�e, d�sinstallez-la avant d'extraire la nouvelle. Pour cela, lancez <strong>setup-infinityanimations.exe</strong>, d�sinstallez tous les composants pr�c�demment install�s et supprimez le r�pertoire infinityanimations.</em>

<em>Lorsque vous installez ou d�sinstallez, <strong>ne fermez pas la fen�tre <acronym title="Disk Operating System">DOS</acronym></strong> en cliquant sur le bouton <strong>X</strong> ! Au lieu de cela, appuyez sur la touche <strong>Entr�e</strong> lorsque l'invite de commandes vous le demande.</em>

Par pr�caution, <strong>d�sactivez les antivirus</strong> ou tout logiciel r�sidant en m�moire avant d'installer ce mod, ou tout autre mod. Certains (en particulier avast et Norton !) ont une f�cheuse tendance � d�clarer les ex�cutables des mods comme des faux positifs, provoquant ainsi l'�chec de la proc�dure d'installation.

Vous pouvez extraire les fichiers de l'archive avec <a href="http://www.rarlab.com/download.htm">WinRAR</a>, <a href="http://www.zipgenius.it/ita/?page_id=12">ZipGenius</a>, ou n'importe quel autre logiciel capable de d�compresser les fichiers .rar. [<em>NdT : comme <a href="http://www.7-zip.org/">7-Zip</a></em>]

<strong>Important : </strong>T�l�chargez tout le contenu dont vous avez besoin dans la section de t�l�chargement d'Infinity Animations de <a href="http://www.shsforums.net/index.php?autocom=downloads&showcat=98">Spellhold Studios</a>. En cas de doute, t�l�chargez toutes les archives (la plupart des installations de megamods les n�cessitent toutes). Extrayez les archives en s�lectionnant l'option � Ne pas extraire les chemins d'acc�s � de l'onglet <strong>Avanc�</strong> de WinRAR. Assurez-vous aussi que le � Chemin d'acc�s de destination � de l'onglet <strong>G�n�ral</strong> se termine par <strong>/content</strong> ou <strong>/restore</strong> apr�s <strong>infinityanimations</strong> (ils ne doivent pas comporter de sous-r�pertoires).

<p>Extrayez toutes les archives dans le r�pertoire /content sauf IA_BG2_Restores.rar, dont les fichiers doivent aller dans le r�pertoire /restore. Si vous extrayez IA_Wh_Dr_Wyv_LoP.rar (� ce jour, seul le mod la Sph�re Planaire en a besoin), vous pouvez supprimer le fichier The_Lady's_Shadow.rar apr�s extraction, car il n'est pas utilis� � cause des dimensions de l'animation, trop grandes pour �tre support�es par le moteur du jeu.</p>

Si vous utilisez WinZip, assurez-vous que la case � Utiliser les noms de r�pertoire � <em>n'est pas coch�e</em>.

Une fois l'extraction termin�e, les r�pertoires � content � et/ou � restore � devraient contenir une multitude de fichiers .bam, et AUCUN sous-r�pertoire. Le programme d'installation vous pr�viendra s'il vous manque des fichiers n�cessaires. � ce moment, vous pourrez quitter le programme, t�l�charger le contenu manquant, l'extraire et relancer la proc�dure d'installation.

## 

#### Windows

Extrayez le contenu du mod dans le r�pertoire du jeu que vous souhaitez modifier (<acronym title="Baldur's Gate II">BG2</acronym>, <acronym title="Baldur's Gate Trilogy">BGT</acronym> ou EasyTutu). Si l'extraction s'est d�roul�e correctement, un r�pertoire infinityanimations et un fichier setup-infinityanimations.exe doivent �tre apparus dans le r�pertoire du jeu. Pour installer le mod, double-cliquez sur <strong>setup-infinityanimations.exe</strong> et suivez les instructions apparaissant � l'�cran.

Pour r�installer, d�sinstaller ou changer certains composants, lancez <strong>setup-infinityanimations.exe</strong> dans votre r�pertoire de jeu.

## 

#### Linux

Extrayez le contenu du mod dans le r�pertoire du jeu que vous souhaitez modifier.

T�l�chargez la version la plus r�cente de <acronym title="Weimer Dialogue Utility">WeiDU</acronym></a> pour Linux sur <a href="http://www.weidu.org/%7Ethebigg/">WeiDU.org</a>, puis copiez WeiDU et WeInstall dans /usr/bin. Ouvrez ensuite un terminal et allez (<strong>cd</strong>) dans le r�pertoire d'installation de votre jeu.

<em>Facultatif : lancez � tolower � et r�pondez oui (� Y �) aux deux requ�tes. Il n'est pas n�cessaire d'ex�cuter la deuxi�me option (linux.ini) si vous l'avez d�j� ex�cut�e une fois dans le m�me r�pertoire. Pour gagner du temps, l'archive est d�j� � tolower-is�e �, il n'y a donc pas non plus besoin d'ex�cuter la premi�re option (passage des noms de fichiers en minuscules), si vous n'avez extrait que ce mod depuis la derni�re fois que vous avez pass� des noms de fichiers en minuscules. Si vous avez un doute, il vaut mieux ex�cuter tolower et accepter les deux options.</em>

Pour installer le mod, ex�cutez <strong>WeInstall setup-infinityanimations</strong> dans votre r�pertoire de jeu. Ex�cutez ensuite <strong>wine BGMain.exe</strong>, et commencez votre partie.

## 

#### Note pour effectuer une d�sinstallation compl�te

En plus des m�thodes d�taill�es plus haut pour supprimer des composants, il est possible de d�sinstaller compl�tement le mod en tapant <strong>setup-infinityanimations --uninstall</strong> dans une ligne de commandes, ce qui supprimera tous les composants sans devoir ingurgiter tous les messages.</br>
<div style="text-align:right"><a href="#components">Retour en haut de page</a></div>

## 

#### <a name="config" id="config">:warning: Avertissement : nouvelle proc�dure d'installation

##### Depuis la version 6.0.0, les variables n�cessaires � l'installation sont lues dans le fichier <a href="../ia-config-default.ini"><em>ia-config-default.ini</em></a> ou dans le fichier <em>ia-config.ini</em>, si ce dernier existe.

Dans les versions pr�c�dentes, vous deviez t�l�chargez tout le contenu dont vous avez besoin dans la section de t�l�chargement d'Infinity Animations de <a href="http://www.shsforums.net/files/category/98-infinity-animations/">Spellhold Studios</a>, puis extraire les archives dans les sous-r�pertoires <strong>content</strong> ou <strong>restore</strong> du r�pertoire infinityanimations. Le programme d'installation vous pr�venait s'il vous manquait des fichiers n�cessaires. � ce moment, vous pouviez quitter le programme, t�l�charger le contenu manquant, l'extraire et relancer la proc�dure d'installation.

Dor�navant, le contenu n�cessaire � l'installation de Infinity Animations est inclus dans le r�pertoire <strong>archives</strong> du mod et le composant principal le copie automatiquement dans les sous-r�pertoires <strong>content</strong> et <strong>restore</strong>.

Par d�faut, tout le contenu du r�pertoire archives est install�. Si vous souhaitez limiter le contenu � installer, il vous suffit de modifier les variables concern�es dans le fichier **_ia-config-default.ini_** (situ� dans le r�pertoire infinityanimations) avec Notepad ou un autre �diteur de texte, puis de le sauvegarder sous le nom **_ia-config.ini_**.

Chaque ligne comprend une option de configuration, suivie de � = �, puis d'un chiffre. Tout ce que vous avez � faire, c'est modifier la valeur du chiffre. Par exemple, si vous ne souhaitez pas utiliser les animations de svirneblins, modifiez la valeur de la variable ia_iwd_svirfneblin en 0. Si vous d�cidez d'installer un composant n�cessitant des fichiers que vous avez choisi de ne pas installer, le programme d'installation vous pr�viendra de leur absence. Vous pourrez alors quitter le programme, modifier la valeur dans le fichier ini et relancer la proc�dure d'installation. 

Le programme d'installation lira les valeurs des variables dans les deux fichiers ini et donnera la priorit� aux v�tres. Si le fichier ia-config.ini contient une valeur d'option non conforme, ou si une variable est manquante, il la remplacera par sa valeur par d�faut (celle correspondant � l'installation � <em>standard</em> �).

Voici le tableau des options concern�es :</br></br>

<table style="margin-left: 80px; width: 90%; " summary="Installation variables list">
	<tr style="font-size: 125%; line-height: 160%;">
		<th style="border: 1px solid #781808; text-align: center; background-color: #781808; color: #e5e5e5; ">Variable</th>
		<th style="border: 1px solid #781808; text-align: center; background-color: #781808; color: #e5e5e5; ">Description</th>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_base_anims</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content 001 - Base Content<br><br>
		- Contenu : animations de Basilic et de Tasloi, les animations manquantes de IWD r�f�renc�es dans BGII (Scarab�e bombardier, Scarab�e de feu, Scarab�e scolyte, Scarab�e rhinoc�ros, Cyclope, Fant�me, Bl�me majeur, Goule majeure, Histachii, Homme l�zard, Homme l�zard roi, Liche blanche, N�crophage gris/vert/jaune, Ombre petite/grande), Ombre des roches ancienne, Troll des glaces, Troll des neiges) zombi bleu/jaune), les animations de personnages de BG I. Comprend les tables et les jeux de sons des cr�atures concern�es et les animations de cimeterre de BG1.<br>
		- N�cessaire pour les composants Morts-vivants diff�renci�s [400], Plus d'animations de base [500], Animations de personnages de BG1 pour les PNJs [8000-8010-8020-8030] et pour les PJ export�s [9500-9510-9520].<br>
		- N�cessaire pour les mods BP, CtB, Drizzt Saga, NEJ, RoT, SOS, TDD, TS et RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_belhifet_and_marilith</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - IWD Belhifet and Marilith<br><br>
		- Contenu : animations et jeux de sons du Belhifet et de la Marilith d'IWD. Comprend les tables et les jeux de sons des cr�atures concern�es.<br>
		- N�cessaire pour les mods Drizzt Saga, RoT, TDD, TS et TS-BP.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_bg2_restores</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - BG2 Restores<br><br>
		- Contenu : Femme araign�e statique (MSPL), Goblin d'�lite avec arc (MGO4), Goblin d'�lite avec hache (MGO3), Liche (MLIC), Liche noire (MLER), Marilith (MTAN), Myconide bleu (MMY2), Orog (MNO1), Orog d'�lite (MNO2), Orque d'�lite m�l�e (MOR3). Comprend les tables des jeux de sons des cr�atures concern�es.<br>
		- Il s'agit du contenu n�cessaire pour restaurer les slots d'animation de BG2 �cras�s par certains mods. Il est uniquement n�cessaire pour une mega installation comprenant les mods suivants : BP, BoneHill, CtB, Drizzt Saga, NEJ2, RoT, SOS, TDD, TS, TS-BP, Sheena, Planar Sphere et RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_bg2_iwd2</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content 002 - IWDII and unused BGII Animations<br><br>
		- Contenu : toutes les animations de IWD II que l'on ne trouve ni dans BGII (Ellesime avec des cheveux blancs, G�ant du feu alternatif, Cr�ature des lagons, Tyramort), ni dans IWD (Abishai blanc, Blaireau-garou, Chim�re, Crochorreur, Demi-dragon noir/rouge, Drider m�le/femelle, �l�mentaire de l'eau petit, Freyeur normale/grande, G�ant Fomorian, Gobelins de IWD II, Gobelins chevaucheurs de worg, Gobelours, Capitaine gobelours, Isair, Kegs, Lemure, Madae, Malarite, Orog Shaman, Orques morts-vivants, Rat-garou, Tr�ant, Sanglier arctique, Shenrical, Worg, Yuan-Ti demi-sang). Comprend les tables et les jeux de sons des cr�atures concern�es.<br>
		- N�cessaire pour les composants Animation d'Isair pour les cambions [210-230], Animation de Madae pour les alu-d�mons [260-280] et Plus d'animations d'Icewind Dale II [600].<br>
		- N�cessaire pour les mods BP, CtB, NEJ, Planar Sphere, RoT et Sheena.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_ee_tob</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - EE games new Animations ported to ToB<br><br>
		- Contenu: sanglier sauvage, gobelours chaman, soldat crois�, chien gris, dragon vert (IWD), dragon vert juv�nile, dragon rouge juv�nile, dragons jeunes (vert, d'argent, blanc), mort noy� rouge, ettin fant�me, d�mon rouge, g�ant des collines, Gibberling Brood, gobelins Mkhiin (commun, avec arc, avec b�ton, en armure et hache, en armure et arc), gobelins chevaucheurs de worg (d'�lite, chaman), golem minuscule, demi-dragon vert, hephernaan, m�galo-mille-pattes, pouding noir, magicien rouge, �arin (aux habits sombres, verts, rouges), serpent aquatique, araign�e aquatique, trolls (d'eau douce, spectral), ver de tunnels, grande wiverne albinos, wiverne blanche. Comprend les tables et les jeux de sons des cr�atures concern�es.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
			</tr>
			<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_fiends_genies</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Fiends and Genies<br><br>
		- Contenu : D�mon bleu, D�mon vert (Nabassu), Marilith sombre, Maurezhi, Myrlochar, Dao, Dao avec jambes, Efrit, Efrit avec jambes, Jann, Jann avec jambes, Marid, Marid avec jambes, Yochlol, Reine des goules, Guenaudes (Annis, noire, verte, des mers). Comprend aussi les fichiers de sons pour Erinyes, Gelugon et Tieffelins.<br>
		- N�cessaire pour les composants Genies diff�renci�s [50] et D�mons diff�renci�s [100].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_iwd</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Remaining IWD Animations<br><br>
		- Contenu : toutes les animations manquantes de IWD non comprises dans les autres archives (�l�mentaire de terre/eau/feu, Sahuagin petit/grand, Armures anim�es bronze/sombre/verte, Arundel, Barbare Shaman (avec marteau, b�ton, gourdin), Barbare guerrier (bleu, rouge, marron), Barbare Icasaracht, Belhifet pr�tre, Fatalit� rampante, Mort noy�, G�ant du feu de IWD, Golem de fer de IWD, R�morhaz, Seer, Yeti, Ombre des roches Vodyanoi, Verbeeg, N�crophage des tertres). Comprend les tables et les jeux de sons des cr�atures concern�es.<br>
		- N�cessaire pour les composants D�mons diff�renci�s [100], Morts-vivants diff�renci�s [400], Combattants squelettes [410-415-420], Animation de pauvre h�re [450-455-460] et Plus d'animations d'Icewind Dale [550].<br>
		- N�cessaire pour les mods BP, BH, CtB, NEJ, RoT, SOS et TS.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_iwd_svirfneblin</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - IWD Svirfneblin<br><br>
		- Contenu : les animations de IWD/IWD2 pour svirfneblins (gnomes des profondeurs). Par d�faut, la couleur de leur peau est p�les alors que, dans les r�f�rences AD&D, elle devrait �tre plus fonc�e (couleur pierre). Le jeu original comportait des variantes avec et sans pioches (mais sans animation d'arme s�par�e). Comme ces emplacements ne sont pas palettis�s, les variantes suivantes sont disponibles (les deux derni�res �tant des versions personnalis�es des animations p�les IWD): Svirfneblin p�le avec hache, Svirfneblin p�le sans hache, Svirfneblin fonc� avec hache, Svirfneblin fonc� sans hache. Comprend des jeux de sons emprunt�s � NWN.<br>
		- N�cessaire pour le composant Animations de svirfneblins [480-490].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_moinesse_edits_iaised</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Moinesse's Avatar Edits (IA compatible version)<br><br>
		- Contenu : Barbare humain, Druidesse humaine, Guerri�re humaine, Magicienne humaine, Magicienne elfe, Voleuse humaine, Ninja humain, Vampire homme.<br>
		- N�cessaire pour le composant Avatars de Moinesse pour IA [7000-7010-7020-7030].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_nwn_01_modron</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - WoRm's NWN Ports and Alternate Modron<br><br>
		- Contenu : Modron alternatif, animations de NWN port�es par WoRm (Amel, Basilic, Bebilith, Hamatula, Osyluth, Diantrefosse, �pouvantail, Vedred). Comprend les tables et les jeux de sons des cr�atures concern�es.<br>
		- N�cessaire pour les composants D�mons diff�renci�s [100], Diantrefosses {150-175], Plus d'animations de Neverwinter Nights [650] et pour le mod RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_nwn_misc_i</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Miscellaneous NWN Animations I<br><br>
		- Contenu : B�te �clipsante, G�ante du feu et du givre, Scarab�e bombardier, Succube (avec les animations d'armes), l'esp�ce de chose bovine (ne me demandez pas pourquoi). Comprend les tables et les jeux de sons des cr�atures concern�es.<br>
		- N�cessaire pour les composants D�mons diff�renci�s [100], Plus d'animations de Neverwinter Nights [650] et pour le mod RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_pst_abishai</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - PST Abishai<br><br>
		- Contenu : Abishai bleue, noire, rouge et verte (d'apr�s les animations de PS:T). Comprend leurs jeux de sons.<br>
		- N�cessaire pour le composant D�mons diff�renci�s [100].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_pst_paletted</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - PST Paletted Animations<br><br>
		- Contenu : Femme Aasimar, Baurier M�le, Catin, Citoyen et Citoyenne de Maudith, Citoyen et Citoyenne des classes sup�rieures, Femme et Homme poussi�re, Femme et homme goule, Githzerai, Homme-dieu, Citoyen et Citoyenne des classes inf�rieures, Magicien citoyen, Marchand, Midwife, Sicaire et Grand sicaire, Pr�tre et Travailleur squelette, Thokola, Tieffelin homme et femme, Zombi femme et homme. Comprend leurs jeux de sons.<br>
		- N�cessaire pour le composant Plus d'animations de Planescape: Torment [710-720-760-740].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_shadows_harpy_frostgiant</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Shadows, Harpy and Frost Giant<br><br>
		- Contenu : Ombres alternatives d'IWD (� murky �), Harpie et G�ant du givre d'IWD. Comprend les tables et les jeux de sons des cr�atures concern�es.<br>
		- N�cessaire pour le composant Morts-vivants diff�renci�s [400] et pour les mods BP, Drizzt Saga, NEJv691, RoT, TDD et TS.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_wh_dr_wyv_lop</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - White Wyvern and Dragon, Lady of Pain<br><br>
		- Contenu : Dragon blanc et Wiverne majeure blanche d'IWD, Dame de la Douleur. Comprend les tables et les jeux de sons des cr�atures concern�es.<br>
		- N�cessaire pour le mod Planar Sphere.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par d�faut]</span></td>
	</tr>
</table><br>
<div style="text-align:right"><a href="#components">Retour en haut de page</a></div>


<hr>


## <a name="components" id="components"></a>Composants

Le programme d'installation comprend les composants suivants. Chacun poss�de un num�ro distinct et pr�-d�fini qui lui attribue une position d�termin�e (<em>NdT : mot-cl� DESIGNATED en langage WeiDU</em>] ; ce qui permet aux autres composants de le d�tecter et aux utilitaires d'installation automatiques comme le BiG World Setup de pr�ciser quels composants installer.

Tous les sous-composants n�cessitent le composant principal, car c'est lui qui installe le nouveau contenu. Tous les autres composants sont optionnels. Notez aussi qu'aucun composant n'affecte les <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym> recrutables, un point qu'il est pr�f�rable de laisser � la discr�tion de chaque moddeur. Par cons�quent, si un composant pr�tend affecter toutes les femmes Tieffelin, en aucune fa�on il ne modifiera l'apparence des PNJs Amber et Fade.</br>


><span style="margin-left: 50px;"><a href="#0">[0] Infinity Animations (commposant principal)</a></span></br>
><span style="margin-left: 50px;"><a href="#25">[25] Correction des animations des humano�des</a></span></br>
><span style="margin-left: 50px;"><a href="#50">[50] G�nies diff�renci�s</a></span></br>
><span style="margin-left: 50px;"><a href="#100">[100] D�mons diff�renci�s</a></span></br>
><span style="margin-left: 50px;"><a href="#150">[150-175] Diantrefosses</a></span></br>
><span style="margin-left: 50px;"><a href="#210">[210-230] Animation d'Isair pour les cambions</a></span></br>
><span style="margin-left: 50px;"><a href="#260">[260-280] Animation de Madae pour les alu-d�mons</a></span></br>
><span style="margin-left: 50px;"><a href="#400">[400] Morts-vivants diff�renci�s</a></span></br>
><span style="margin-left: 50px;"><a href="#410">[410-415-420] Combattants squelettes</a></span></br>
><span style="margin-left: 50px;"><a href="#450">[450-455-460] Animation de pauvre h�re</strong> [<em>NdT : seer en anglais</em>].</a></span></br>
><span style="margin-left: 50px;"><a href="#480">[480-490] Animations de svirneblins</a></span></br>
><span style="margin-left: 50px;"><a href="#500">[500] Plus d'animations de base</a></span></br>
><span style="margin-left: 50px;"><a href="#550">[550] Plus d'animations d'Icewind Dale</a></span></br>
><span style="margin-left: 50px;"><a href="#600">[600] Plus d'animations d'Icewind Dale II</a></span></br>
><span style="margin-left: 50px;"><a href="#650">[650] Plus d'animations dee Neverwinter Nights</a></span></br>
><span style="margin-left: 50px;"><a href="#710">[710-720-730-740] Plus d'animations de Planescape: Torment</a></span></br>
><span style="margin-left: 50px;"><a href="#7000">[7000-7010-7020-7030] Avatars de Moinesse pour IA</a></span></br>
><span style="margin-left: 50px;"><a href="#8000">[8000-8010-8020-8030] Animations de personnages de BG1 pour les PNJs</a></span></br>
><span style="margin-left: 50px;"><a href="#9000">[9000] Correction des r�f�rences des cr�atures dans les cartes</a></span></br>
><span style="margin-left: 50px;"><a href="#9500">[9500-9510-9520] Animations de personnages de BG1 pour les PJs</a></span></br>
><span style="margin-left: 50px;"><a href="#9600">[9600-9610-9620] Animations de personnages de BG1 dans les parties sauvegard�es</a></span></br>
><span style="margin-left: 50px;"><a href="#9900">[9900-9910] Correction des animations dans les parties sauvegard�es</a></span>

## 

<a name="0" id="0"></a><strong>0. Infinity Animations (commposant principal)</strong><br />
<em><span style="margin-left: 15px;">N�cessite le patch <acronym title="Throne of Bhaal">ToB</acronym> v26498.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>V�rifie la pr�sence des fichiers n�cessaires et la validit� de l'ex�cutable.</li>
	<li>Fait une copie de sauvegarde de l'ex�cutable et le modifie.</li>
	<li>Remplace les animations _LOW de cr�atures.</li>
	<li>Met � jour les fichiers .ids.</li>
	<li>R�tablit toutes les animations �cras�es par les mods.</li>
	<li>Copie les nouvelles animations (toutes celles extraites dans le r�pertoire /content).</li>
	<li>Corrige toutes les cr�atures affect�es.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="25" id="25"></a><strong>25. Correction des animations des humano�des</strong><br />
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux guerriers humains l'animation de guerrier plut�t que celle de pr�tre.</li>
	<li>Attribue aux guerriers elfes l'animation de guerrier plut�t que celle de pr�tre.</li>
	<li>Attribue aux guerriers petites-personnes l'animation de guerrier plut�t que celle de pr�tre.</li>
	<li>Attribue aux guerri�res humaines l'animation de guerri�re plut�t que celle de pr�tresse.</li>
	<li>Attribue aux magiciens humains l'animation de magicien plut�t que celle de pr�tre.</li>
	<li>Attribue aux magiciens elfes l'animation de magicien plut�t que celle de pr�tre.</li>
	<li>Attribue aux voleurs humains l'animation de voleur plut�t que celle de guerrier.</li>
	<li>Attribue aux voleuses humaines l'animation de voleuse plut�t que celle de guerri�re.</li>
	<li>Attribue aux moines humains l'animation de moine plut�t que celle de pr�tre.</li>
	<li>Attribue aux pirates humains l'animation de pirate.</li>
	<li>Attribue aux marins humains l'animation de marin.</li>
	<li>Attribue aux gardes amniens l'animation de garde amnien.</li>
	<li>Attribue aux Voleurs de l'ombre humains l'animation de voleur de l'ombre.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="50" id="50"></a><strong>50. G�nies diff�renci�s</strong><br />
<em><span style="margin-left: 22px;">N�cessite l'archive IA_Fiends&#95;Genies.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Utilise les animations de djinn, d'efrit, de dao, de jann et de marid lorsqu'elles sont pertinentes.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="100" id="100"></a><strong>100. D�mons diff�renci�s</strong><br />
<em><span style="margin-left: 34px;">N�cessite les archives IA_Fiends&#95;Genies.rar, IA&#95;IWD.rar et IA&#95;PST&#95;Abishai.rar.<br></span>
<span style="margin-left: 34px;">N�cessite l'archive IA_NWN&#95;01&#95;Modron.rar seulement si certains mods sont install�s.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux nabassus une animation de tanar'ri vert-gris.</li>
	<li>Attribue au D�mon chromatique une animation de base un peu plus color�e [<em>NdT : bleue</em>].</li>
	<li>Attribue aux bebiliths (seulement dans les mods Longer Road et Drizzt Saga) une animation provenant de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue � certaines mariliths une animation plus sombre.</li>
	<li>Attribue aux <acronym title="Night hag">sorci�res de la nuit</acronym> [<em>NdT : ou guenaudes noires selon les traductions</em>] l'animation de night hag de <acronym title="Planescape: Torment">PS:T</acronym>.</li>
	<li>Attribue aux d�mons d'os l'animation d'osyluth de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux g�lugons (seulement ceux ajout�s par un mod) l'animation de salamandre des glaces.</li>
	<li>Attribue aux yochlols (sauf celles sous l'apparence d'elfes noires) une animation d'otyugh plus fonc�e.</li>
	<li>Attribue aux abisha�s d'argent, verts et rouges leur animation appropri�e d'<acronym title="Icewind Dale">IWD</acronym> ou de <acronym title="Planescape: Torment">PS:T</acronym>.</li>
	<li>Attribue aux manes l'animation de mort noy� d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux erinyes un avatar d'elfe dot�e d'ailes noires.</li>
	<li>Attribue aux succubes l'animation de succube de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux maurezhis l'animation de maurezhi (une goule sombre).</li>
	<li>Attribue aux glabrezus la bonne animation de glabrezu.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="150" id="150"></a><strong>Diantrefosses<br />
150.</strong> Attribuer � tous l'animation de <acronym title="Neverwinter Nights">NWN</acronym>.n<br />
<strong>175.</strong> Attribuer � certains l'animation de <acronym title="Neverwinter Nights">NWN</acronym>.<br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_NWN&#95;01&#95;Modron.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Choisir un sous-composant (ou aucun). � Certains � = environ la moiti�, d�termin�s al�atoirement.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="210" id="210"></a><strong>Animation d'Isair pour les cambions<br />
210.</strong> � tous les cambions.<br />
<strong>230.</strong> � certains cambions.<br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_BGII&#95;IWDII.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>M�me principe que celui du composant Diantrefosses.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="260" id="260"></a><strong>Animation de Madae pour les alu-d�mons<br />
260.</strong> � toutes les alu-d�mons.<br />
<strong>280.</strong> � certaines alu-d�mons.<br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_BGII&#95;IWDII.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>M�me principe que celui du composant Diantrefosses.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="400" id="400"></a><strong>400. Morts-vivants diff�renci�s</strong><br />
<em><span style="margin-left: 34px;">N�cessite les archives IA&#95;Base&#95;Anims.rar, IA&#95;IWD.rar et Shadows&#95;harpy&#95;frostgiant.zip.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux banshees l'animation de <acronym title="NdT : wailing virgin">vestale g�missante</acronym>.</li>
	<li>Attribue aux cr�nes flottants l'animation de demi-liche.</li>
	<li>Attribue aux bl�mes majeurs l'animation de bl�me majeure d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux fant�mes classiques l'animation de fant�me d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux goules majeures l'animation de goule majeure d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue � certaines goules l'animation de reine des goules de <acronym title="Planescape: Torment">PS:T</acronym>.</li>
	<li>Attribue aux liches majeures l'animation de liche blanche d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux apparitions l'animation de <acronym title="NdT : mist creature">cr�ature brumeuse</acronym>.</li>
	<li>Attribue aux revenants l'animation de revenant.</li>
	<li>Attribue aux d�mombres et aux ombre d�moniaques l'animation d'ombre.</li>
	<li>Attribue aux �mes en peine l'animation de grande ombre d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux spectres l'animation <acronym title="NdT : large shadow alternate MURKY">alternative de grande ombre</acronym> d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux ombres l'animation de petite ombre d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue � certaines ombres l'animation <acronym title="NdT : small shadow alternate MURKY">alternative de petite ombre</acronym> d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux squelettes majeurs l'animation de squelette monstrueux [<em>NdT : combattant squelette</em>].</li>
	<li>Attribue aux horreurs lunaires l'animation de d�mon squelette [<em>NdT : d�mon d'os</em>].</li>
	<li>Attribue aux vampires femmes l'animation de vampire femme</li>
	<li>Attribue aux n�crophages l'animation de n�crophage gris d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux zombis vert l'animation de n�crophage vert d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux seigneurs zombi l'animation de n�crophage jaune d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux chevaliers morts-vivants et assimil�s l'animation de n�crophage des tertres d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux zombis majeurs l'animation de zombi jaune d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux lac�dons et aux zombis des mers l'animation de zombi bleu d'<acronym title="Icewind Dale">IWD</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="410" id="410"></a><strong>Combattants squelettes<br />
410.</strong> Animation de n�crophage des tertres [<em>NdT : Wight Barrow</em>].<br />
<strong>415.</strong> Animation de squelette normal [<em>NdT : jaune</em>].<br />
<strong>420.</strong> Animation de combattant squelette.<br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_IWD.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue l'animation s�lectionn�e � tous les combattants squelettes.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="450" id="450"></a><strong>Animation de pauvre h�re</strong> [<em>NdT : seer en anglais</em>].<br />
450.</strong> Pour certains mendiants et esclaves.<br />
<strong>455.</strong> Pour certains mendiants.<br />
<strong>460.</strong> Pour certains esclaves.<br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_IWD.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>M�me principe que celui du composant Diantrefosses.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="480" id="480"></a><strong>Animations de svirneblins<br />
480.</strong> Seulement les animations.<br />
<strong>490.</strong> Les animations et les sons.<br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_IWD&#95;Svirfneblin.rar.</span><br />
<span style="margin-left: 34px;">Pas propos� si le mod Aurora's Shoes and Boots est install� (car il fait la m�me chose).</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue toutes les diff�rentes animations de svirfneblin aux gnomes des profondeurs de l'Ombreterre.</li>
</ul><br />

<a name="500" id="500"></a><strong>500. Plus d'animations de base</strong><br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux histachii l'animation d'histachii d'<acronym title="Icewind Dale">IWD.</acronym></li>
	<li>Attribue aux guerriers hommes-l�zards l'animation d'homme-l�zard d'�lite (brune).</li>
	<li>Attribue au chaman homme-l�zard l'animation d'homme-l�zard vert.</li>
	<li>Attribue aux chefs hommes-l�zards l'animation de roi homme-l�zard.</li>
	<li>Attribue aux diff�rentes esp�ces de trolls leur animation appropri�e (normale, bleue, des glaces, des neiges, petite).</li>
	<li>Attribue aux anciens ombres des roches l'animation d'ombre des roches anciens d'<acronym title="Icewind Dale">IWD</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="550" id="550"></a><strong>550. Plus d'animations d'Icewind Dale</strong><br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_IWD.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux armures anim�es les animations de<acronym title="NdT : animated plate">petites armures anim�es</acronym> d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux Archidruides l'animation d'Arundel d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux barbares leur animation appropri�e (marron, rouge, brun et chaman).</li>
	<li>Attribue aux �l�mentaires majeurs diff�rentes animations de <acronym title="Baldur's Gate II">BG2</acronym>/<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue � certains g�ants du feu l'animation de g�ant du feu d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux golems de fer l'animation de golem de fer d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux golems d'adamantine l'animation de golem de fer de <acronym title="Baldur's Gate II">BG2</acronym>.</li>
	<li>Attribue aux pr�tresses sahuagins l'animation de sahuagin d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux gardes royaux sahuagins l'animation de grand sahuagin de <acronym title="Baldur's Gate II">BG2</acronym>.</li>
	<li>Attribue aux chefs sahuagins l'animation de grand sahuagin d'<acronym title="Icewind Dale">IWD</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="600" id="600"></a><strong>600. Plus d'animations d'Icewind Dale II</strong><br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_BGII&#95;IWDII.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux g�ants du feu majeurs et aux firbolgs l'animation alternative de g�ant du feu.</li>
	<li>Attribue des animations diff�renci�es aux gobelins (chevaucheurs de worg, leaders, marrons, verts, d'�lite).</li>
	<li>Attribue aux crochorreurs l'animation de crochorreur.</li>
	<li>Attribue aux druides de l'Ombre l'animation de Malarite.</li>
	<li>Attribue aux clones d'Ellesime l'animation d'Ellesime avec des cheveux blancs.</li>
	<li>Attribue aux brumes empoisonn�es l'animation de <acronym title="NdT : lagoon creature">cr�ature des lagons</acronym>.</li>
	<li>Attribue aux tyramorts l'animation de <acronym title="NdT : death tyrant">tyramort</acronym>.</li>
	<li>Attribue aux rats-garous l'animation de rat-garou.</li>
	<li>Attribue aux worgs l'animation de worg d'<acronym title="Icewind Dale II">IWD2</acronym>.</li>
	<li>Attribue aux Yuan-Ti demi-sang l'animation de yuan-ti demi-sang de <acronym title="Icewind Dale II">IWD2</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="650" id="650"></a><strong>650. Plus d'animations de Neverwinter Nights</strong><br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_NWN&#95;01&#95;Modron.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux porteurs de faux (dans <acronym title="Northern Tales of the Sword Coast">NTotSC</acronym>) l'animation de Amel de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux scarab�es bombardiers (dans Big Picture) l'animation de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux basilics majeurs l'animation de basilic de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux modrons l'animation de modron.</li>
	<li>Attribue aux b�tes �clipsantes (dans AjocMod) l'animation de <acronym title="Neverwinter Nights">NWN</acronym>-<acronym title="Community Creature Project">CCP</acronym>.</li>
	<li>Attribue � certains g�ants du feu l'animation de g�ante du feu de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue � certains g�ants du froid l'animation de g�ante du froid de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="710" id="710"></a><strong>Plus d'animations de Planescape: Torment<br />
710.</strong> 25 % des cr�atures non-recrutables concern�es.<br />
<strong>720.</strong> 50 % des cr�atures non-recrutables concern�es.<br />
<strong>730.</strong> 75 % des cr�atures non-recrutables concern�es.<br />
<strong>740.</strong> Toutes les cr�atures non-recrutables concern�es.<br />
<em><span style="margin-left: 34px;">N�cessite l'archive IA_PST&#95;Paletted.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux voleuses humaines l'animation de <acronym title="NdT : female Curst townie">citoyenne de Maudith</acronym>.</li>
	<li>Attribue aux voleurs humains l'animation de <acronym title="NdT : male Curst townie">citoyen de Maudith</acronym>.</li>
	<li>Attribue aux femmes moines l'animation de <acronym title="NdT : female Dustman">femme-poussi�re</acronym>.</li>
	<li>Attribue aux hommes moines et aux hommes-poussi�re l'animation d'<acronym title="NdT : male Dustman">homme-poussi�re</acronym>.</li>
	<li>Attribue � certaines goules l'animation de femme goule.</li>
	<li>Attribue � certaines goules l'animation d'homme goule.</li>
	<li>Attribue aux forgerons humains l'animation d'<acronym title="NdT : Godsman">homme-dieu</acronym>.</li>
	<li>Attribue aux mercenaires et bandits porteurs de hache et de marteau l'animation de <acronym title="NdT : large thug">grand sicaire</acronym>.</li>
	<li>Attribue aux mercenaires et bandits porteurs d'�p�e et de dague l'animation de <acronym title="NdT : small thug">sicaire</acronym>.</li>
	<li>Attribue aux paysannes humaines l'animation <acronym title="NdT : female lower-class townie">citoyenne des classes inf�rieures</acronym>.</li>
	<li>Attribue aux paysans humains l'animation de <acronym title="NdT : male lower-class townie">citoyen des classes inf�rieures</acronym>.</li>
	<li>Attribue aux marchands humains l'animation de marchand.</li>
	<li>Attribue aux marchandes humaines l'animation de <acronym title="NdT : midwife">midwife</acronym>.</li>
	<li>Attribue aux prostitu�es l'animation de <acronym title="NdT : harlot">catin</acronym>.</li>
	<li>Attribue aux mages squelettes l'animation de pr�tre squelette.</li>
	<li>Attribue aux squelettes l'animation de <acronym title="NdT : skeleton worker">travailleur squelette</acronym>.</li>
	<li>Attribue aux femmes tieffelins l'animation de femme tieffelin.</li>
	<li>Attribue aux hommes tieffelins l'animation d'homme tieffelin.</li>
	<li>Attribue aux magiciens humains l'animation de <acronym title="NdT : townie wizard">magicien citoyen</acronym>.</li>
	<li>Attribue aux femmes nobles humaines l'animation de <acronym title="NdT : female upper-class townie">citoyenne des classes sup�rieures</acronym>.</li>
	<li>Attribue aux hommes nobles humains l'animation de <acronym title="NdT : male upper-class townie">citoyen des classes sup�rieures</acronym>.</li>
	<li>Attribue � certains zombis l'animation de femme zombi.</li>
	<li>Attribue � certains zombis l'animation d'homme zombi.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="7000" id="7000"></a><strong>Avatars de Moinesse pour <acronym title="Infinity Animations">IA</acronym><br />
7000.</strong> 25 % des cr�atures non-recrutables concern�es.<br />
<strong>7010.</strong> 50 % des cr�atures non-recrutables concern�es.<br />
<strong>7020.</strong> 75 % des cr�atures non-recrutables concern�es.<br />
<strong>7030.</strong> Toutes les cr�atures non-recrutables concern�es.<br />
<em><span style="margin-left: 44px;">N�cessite l'archive Moinesse_edits&#95;IAised.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux barbares humains l'animation de barbare homme.</li>
	<li>Attribue aux druidesses humaine l'animation de druidesse.</li>
	<li>Attribue aux guerri�res humaines l'animation de guerri�re humaine.</li>
	<li>Attribue aux magiciennes elfes l'animation de magicienne elfe.</li>
	<li>Attribue aux magiciennes humaines l'animation de magicienne humaine.</li>
	<li>Attribue aux voleuses humaines l'animation de voleuse humaine (� moins qu'elles aient d�j� re�u l'animation de <acronym title="NdT : female Curst townie">citoyenne de Maudith</acronym>).</li>
	<li>Attribue aux ninjas et assassins humains l'animation de ninja humain (� moins qu'ils aient d�j� re�u l'animation de Voleur de l'ombre ou de <acronym title="NdT : male Curst townie">citoyen de Maudith</acronym>).</li>
	<li>Attribue aux vampires hommes l'animation de vampire de Moinesse.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="8000" id="8000"></a><strong>Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym><br />
8000.</strong> 25 % des cr�atures concern�es.<br />
<strong>8010.</strong> 50 % des cr�atures concern�es.<br />
<strong>8020.</strong> 75 % des cr�atures concern�es.<br />
<strong>8030.</strong> La plupart des cr�atures concern�es.<br />
<em><span style="margin-left: 44px;">N�cessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Utilise les animations de personnages originales de Baldur's Gate selon le choix sp�cifi�.</li>
	<li>La derni�re option est intitul�e � la plupart � plut�t que � toutes � car certaines cr�atures sont exclues des modifications.</li>
	<li>Cela inclue les cr�atures utilisant des cimeterres, des katanas ou autre chose d'autre qu'un bouclier dans leur deuxi�me main (ou dot�es de ces comp�tences), puisque <acronym title="Baldur's Gate">BG1</acronym> ne dispose pas de ces animations.</li>
	<li><strong>� utiliser avec pr�caution</strong> avec des <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym> recrutables : si ce composant ne traitera pas les personnages comp�tents en style de combat a deux armes ou �quip�s d'une seconde arme, n'essayez en aucun cas d'�quiper les PNJs d'une seconde arme.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="9000" id="9000"></a><strong>9000. Correction des r�f�rences des cr�atures dans les cartes</strong><br />
<em><span style="margin-left: 44px;">Install� par d�faut.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Corrige les r�f�rences aux animations de cr�atures modifi�es dans les fichiers de cartes (.are) pour mieux les d�tecter.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="9500" id="9500"></a><strong>Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs<br />
9500.</strong> Demander confirmation pour chaque <acronym title="Personnage Joueur [NdT : traduction de PC, ou Player Character">PJ</acronym> export�.<br />
<strong>9510.</strong> Demander confirmation pour les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym> posant probl�me.<br />
<strong>9520.</strong> Modifier tous les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym> sans demander confirmation.<br />
<em><span style="margin-left: 44px;">N�cessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Utilise les animations de personnages originales de Baldur's Gate selon le choix sp�cifi�.</li>
	<li>La deuxi�me option modifie tous les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym>, mais demande une confirmation pour ceux �quip�s de cimeterres, de katanas ou d'autre chose d'autre qu'un bouclier dans leur deuxi�me main.</li>
	<li>Utiliser des cimeterres et des katanas devrait cependant fonctionner, mais ils appara�tront comme des �p�es longues sur les avatars des personnages.</li>
	<li><strong>� utiliser avec pr�caution</strong> : n'essayez pas de porter deux armes, sinon le jeu crashera probablement.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="9600" id="9600"></a><strong>Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> dans les parties sauvegard�es<br />
9600.</strong> Demander confirmation pour chaque personnage.<br />
<strong>9610.</strong> Demander confirmation pour les personnages posant probl�me.<br />
<strong>9620.</strong> Modifier tous les personnages sans demander confirmation.<br />
<em><span style="margin-left: 44px;">N�cessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>M�mes remarques que pour le composant pr�c�dent.</li>
	<li>Vous devrez d�cider de patcher ou non chaque partie sauvegard�e (et le personnage qu'elle contient, si vous avez choisi l'une des options de confirmation).</li>
	<li><strong>Faites une copie de vos parties sauvegard�es</strong> avant de d�sinstaller ce composant, car sa d�sinstallation restaurera les versions pr�sentes lorsque vous l'avez install�.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>

## 

<a name="9900" id="9900"></a><strong>Correction des animations dans les parties sauvegard�es<br />
9900.</strong> Corriger uniquement les animations _LOW.<br />
<strong>9910.</strong> Corriger toutes les animations que <acronym title="Infinity Animations">IA</acronym> a modifi�es.
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>La premi�re option emp�che les crashs du jeu dus au d�placement des slots d'animation _LOW.</li>
	<li>La seconde option fait la m�me chose, et modifie aussi dans vos parties sauvegard�es toutes les animations qui ont �t� modifi�es.</li>
	<li>Vous devrez d�cider de patcher ou non chaque partie sauvegard�e.</li>
	<li>Si vous avez commenc� une nouvelle partie apr�s avoir install� ce mod, alors ce composant n'est pas n�cessaire (� moins que vous ne commenciez dans la section <acronym title="Baldur's Gate II">BG2</acronym> de <acronym title="Baldur's Gate Trilogy">BGT</acronym>).</li>
	<li><strong>Faites une copie de vos parties sauvegard�es</strong> avant de d�sinstaller ce composant, car sa d�sinstallation restaurera les versions pr�sentes lorsque vous l'avez install�.</li>
</ul>
<div style="text-align:right"><a href="#components">Retour � la liste des composants</a></div>


<hr>


## <a name="credits" id="credits"></a>Cr�dits et remerciements

#### Auteure : <a href="http://www.shsforums.net/user/2954-erephine/">Erephine</a>


#### Special Acknowledgements to

- Codage <acronym title="Weimer Dialogue Utility">WeiDU</acronym> : <a href="http://www.shsforums.net/user/5803-miloch/">Miloch</a>.
- Assistance : <a href="http://www.shsforums.net/user/948-arkenor/">Arkenor</a> et <a href="http://www.shsforums.net/user/4994-sergis/">SergIS</a>.
- H�bergement : <a href="http://www.spellholdstudios.net/">Spellhold Studios</a> (<a href="http://www.shsforums.net">Forums</a>).
- etc.


#### Logiciels et outils utilis�s pour la cr�ation de ce mod

- <a href="http://www.weidu.org/%7Ethebigg/"><acronym title="Weimer Dialogue Utility">WeiDU</acronym></a> de Wes Weimer, the bigg et Wisp
- <a href="https://gibberlings3.github.io/iesdp/"><acronym title="Infinity Engine Structures Description Project">IESDP</acronym></a> maintenu par igi et lynx
- <a href="http://forums.pocketplane.net/index.php/topic,25153.msg314249.html#msg314249">Near Infinity</a> de Jon Olav Hauglid, FredSRichardson et Argent77
- <a href="http://www.gibberlings3.net/tools/dltcep.php"><acronym title="Dragonlance Total Conversion Editor Pro">DLTCEP</acronym></a> de Avenger
- <a href="http://www.teambg.eu/?page=tools&amp;cat=32">BAM Workshop</a> de Glenn Flansburg
- <a href="http://www.editpadpro.com/editpadclassic.html">EditPad Classic</a> de Jan Goyvaerts
- <a href="http://www.pspad.com/en/">PSPad</a> de Jan Fiala
- <a href="http://notepad-plus-plus.org/">Notepad++</a> par l'�quipe de Notepad++, Don Ho ; et le plug-in de correction orthographique
- <a href="http://www.shsforums.net/files/file/1048-weidu-highlighter-for-notepad/">WeiDU Notepad++ Highlighters </a> de Argent77


#### Copyrights

###### Ce travail (y compris l'int�gralit� du code et de la documentation) est d�pos� sous la licence <a href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-Noncommercial 3.0 Unported License</a>. Vous �tes libre de partager (copier, distribuer et transmettre) et de modifier (adapter) ce travail, sauf � des fins commerciales. Pour plus de d�tails, consultez la licence <a href="http://creativecommons.org/licenses/by-nc/3.0/legalcode">Creative Commons Public License</a>. Veuillez informer les auteurs de tout changement ou toute mise � jour du mod sur le <a href="http://www.shsforums.net/forum/594-infinity-animations/">forum</a> du mod.
###### Tous les copyrights et marques d�pos�es sont la propri�t� de leurs propri�taires respectifs.
<div style="text-align:right"><a href="#components">Retour en haut de page</a></div>


<hr>


## <a name="versions" id="versions"></a>Historique des versions

##### Version 6 : jour mois 2019

- Principales mises � jour :
    - Modification du code des animations pour les rendre compatibles avec les code pages non occidentaux (suppression de la proc�dure automatique de changement de code page dans le patch de l'ex�cutable). &#128521;
	- Dor�navant, Infinity Animations est livr� avec l'ensemble des animations de cr�atures disponibles. Il n'est donc plus n�cessaire de t�l�charger tous leurs fichiers d'archives, mais vous pouvez toujours s�lectionner celles que vous souhaitez installer. Pour de plus amples pr�cisions sur la mani�re de personnaliser leur installation, veuillez consulter ce <a href="#config">chapitre</a>.
	- Ajout d'une nouvelle cat�gorie de contenu (animations de EE pour ToB) : sanglier sauvage, gobelours chaman, soldat crois�, chien gris, dragon vert (IWD), dragon vert juv�nile, dragon rouge juv�nile, dragons jeunes (vert, d'argent, blanc), mort noy� rouge, ettin fant�me, d�mon rouge, g�ant des collines, Gibberling Brood, gobelins Mkhiin (commun, avec arc, avec b�ton, en armure et hache, en armure et arc), gobelins chevaucheurs de worg (d'�lite, chaman), golem minuscule, demi-dragon vert, hephernaan, m�galo-mille-pattes, pouding noir, magicien rouge, �arin (aux habits sombres, verts, rouges), serpent aquatique, araign�e aquatique, trolls (d'eau douce, spectral), ver de tunnels, grande wiverne albinos, wiverne blanche. Comprend les tables et les jeux de sons des cr�atures concern�es.
- Int�gration des correctifs de code et des animations du BWP Fixpack (merci � leurs auteurs !) :
    - Composant principal : <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-12#entry562939">Correctif par Lollorian des goules transform�es en golems</a> et <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-35#entry579291">patch de Lollorian pour les installations non-biff�es</a>. Source : <a href="https://github.com/BigWorldProject/Big-World-Fixpack/commit/5ff3f32fda8f22711b55cf5065dca194d52cbffd">commit</a>.
	- Composant � Plus d'animations de More Planescape: Torment � : <a href="http://www.shsforums.net/topic/45383-infinity-animations-from-pst/page-3#entry534274">Mise � jour par Miloch's du fichier t-pstanims.tpa</a>, am�lior� par Lollorian.
- Int�gration des correctifs graphiques des animations du BWP Fixpack :
    - Archive IA base_anims : Correctifs des <a href="http://www.shsforums.net/topic/47692-fixed-lizardman-shaman-bug/">animations manquantes des hommes l�zards (verts) quand ils lancent un sort avec des armes</a> de Miloch et <a href="https://www.gibberlings3.net/forums/topic/23792-doppelganger-animations/">Meilleures animations d'attaque du Doppelganger</a> de Polytope.
	- Archive IA_BGII_IWDII : Correctif par Gwendolyne de l'<a href="http://www.shsforums.net/topic/55742-fixed-small-elemental-water-bug/">animation de mort du petit �l�mentaire d'eau d'IWD2</a>.
    - Archive IA_IWD : Correctif par Miloch des <a href="http://www.shsforums.net/topic/53322-sahuagin-bug/?p=530224">sahuagins portant une arbal�te qui faisaient crasher le jeu en marchant</a>.
    - Archive IA_NWN_01_modron : Correctif par Gwendolyne de l'animation de <a href="http://www.shsforums.net/topic/56013-fixed-basilisk-nwn-bug/">basilic de NWN</a>.
	- Archive NWN_Misc_I : Correctif par Gwendolyne de l'animation de <a href="http://www.shsforums.net/topic/55823-fixed-bovine-thing-axe-bug/">l'esp�ce de chose bovine</a>.
- Ajout des animations manquantes de lancement de sort (fichiers bam ca et sp, avec les armes quand n�cessaire) :
	- Archive IA base_anims: scarab�es (bombardier, scolyte, de feu, rhinoc�ros), cyclope, ettin, fant�me, bl�me majeur, goule majeure, gobelins (avec hache, avec arc, d'�lite avec hache, d'�lite avec arc), golem de glace, Histachii, minotaure, momie, orque (m�l�e, archer, d'�lite, archer d'�lite), orog, orog d'�lite, chef orog, salamandre (du feu, du givre), ombre (petite, grande), squelette d�mon, combattant squelette, troll (bleu, des glaces, des neiges), esprit des eaux, yuan-ti, yuan-ti d'�lite, zombi (bleu, jaune).
	- Archive IA BGII_IWDII : sanglier arctique, gobelours, capitaine gobelours, tr�ant, petit �l�mentaire d'eau, g�ant fomorian, gobelins (vert avec hache, vert avec arc, capitaine, d'�lite vert avec hache, d'�lite vert avec arc, chevaucheur de worg, capitaine chevaucheur de worg), crochorreur, kegs, l�mure, orque mort-vivant avec hache, blaireau-garou, rat-garou, worg
	- Archive IA IWD : petites armures anim�es (bronze/sombre/verte), barbare guerrier (bleu, rouge, marron), fatalit� rampante, mort noy�, �l�mentaire (de terre, de feu, d'eau), g�ant du feu, g�ant verbeeg, n�crophage des tertres, r�morhaz, yeti.
	- Archive IA Shadows_Harpy_Frostgiant : ombres alternatives (� murky �), g�ant du givre.
- Mise � jour du composant � D�mons diff�renci�s [100] : suppression d'un code de compatibilit� avec stratagems int�gr� par SCSII depuis la version 13 (f�vrier 2010 : � <em>Avoided a possible clash with other mods by replacing the Abishai in Diathya's group in a more compatibility-friendly way</em> �).
- Correction du composant � Animation de pauvre h�re � [450-455] : les listes de cr�atures � modifier des sous-composants � <em>Pour certains mendiants et esclaves</em>) � et � <em>Pour certains mendiants</em>) � �taient interverties. &#128541;
- Composant � Animations de svirneblins � [480-490] : utilisation de la nouvelle variable t-svi dans une routine unique pour les deux sous-composants.
- Composant � Avatars de Moinesse pour IA � [7000-7010-7020-7030] : int�gration du <a href="http://www.shsforums.net/files/file/967-ia-patch-b5-moinesse-ninja-fix/">correctif de Miloch pour les ninja de Moinesse</a>, n�cessaire si Infinity Animations et le mod Angelo sont install�s ensemble.
- D�coupage du code en composants distincts pour offrir une meilleure lisibilit�.
- D�placement des fichiers tpa (code des composants) dans le nouveau r�pertoire � components � et conservation des fonctions et des macros dans le r�pertoire � lib �.
- Adaptation du code pour une future compatibilit� du mod avec les versions EE, avec notamment l'harmonisation des noms des animations.
- Ajout de commentaires dans les fichiers de code chaque fois que possible.
- Simplification du code :
    - Utilisation de nouvelles fonctions de <acronym title="Weimer Dialogue Utility">WeiDU</acronym> (qui n'existaient pas lorsque Erephine a �crit ce mod) et remplacement de fonctions obsol�tes (comme DECOMPILE_BCS_TO_BAF et DECOMPILE_DLG_TO_D).
    - Utilisation de ps_recursive_copy.tpa, une nouvelle biblioth�que de fonctions WeiDU cr��e par <a href="http://www.shsforums.net/user/10485-sam/">Sam</a>, qui cherche de mani�re r�cursive des fichiers dans un r�pertoire parent, puis les copie dans un autre r�pertoire.
    - Corrections mineures...
- R��criture de l'utilitaire IA Reference Picker et mise � jour de sa documentation.
- Mise � jour du readme (IA prend d�sormais en compte la documentation traduite, ajout de nouvelles illustrations d'animations...).
- Ajout de la traduction fran�aise (Gwendolyne).
- Traification.
- Mise � jour de <acronym title="Weimer Dialogue Utility">WeiDU</acronym> (v246).


##### WeiDU Beta 5: 12 May 2010

- Changed the .exe patch so that it forces a code page change and reboots if a non-Western code page is detected
- Updated the .exe patch so that it recognises <acronym title="Baldur's Gate">BG1</acronym> thief avatars
- Cloned missing animation tables from the unmodded game
- Added other missing animation tables to base content folder
- Adding missing minotaur and water weird sounds
- Disabled problematic stacked animations from chitin.key
- Added creature sounds where relevant (major update here)
- Fixed a minor READ_BYTE glitch in creature patching
- Made it certain so that subcomponents can't be installed if the main component is not installed (to prevent crashes)
- Added night hags to the "Distinctive Fiends" component
- Added ghoul queens to the "Distinctive Undead" component
- Added white-haired Ellesime to the "More <acronym title="Icewind Dale II">IWD2</acronym> Animations" component
- Added lagoon creature to the "More <acronym title="Icewind Dale II">IWD2</acronym> Animations" component
- Deprecated tieflings from the cambion/alu-fiend components in favor of the <acronym title="Planescape: Torment">PS:T</acronym> animation component
- Corrected skeleton warriors appearing as verbeegs glitch
- Added Amel animation to <acronym title="Neverwinter Nights">NWN</acronym> component (if <acronym title="Northern Tales of the Sword Coast">NTotSC</acronym> is installed)
- Added Humanoid Animation Fixes component
- Added Moinesse's Avatars component
- Added More <acronym title="Planescape: Torment">PS:T</acronym> Animations component
- Added <acronym title="Baldur's Gate">BG1</acronym> Character Animations for Saved Games component
- Added saved game animation fixing component
- Traified the entire freaking mod by hand for translators (thanks for nothing, <acronym title="Weimer Dialogue Utility">WeiDU</acronym>! &#128541;)


##### WeiDU Beta 4 : 7 f�vrier 2010

- Ajout du composant � Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym> �.
- Ajout du composant � Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym> �.
- Modification de la proc�dure de modification des d�mons.


##### WeiDU Beta 3 : 1er f�vrier 2010
 
- Correction des bugs d'animations _LOW qui causaient des crashs de zones au chargement.
- Correction des scripts et des dialogues qui <acronym title="Polymorph">m�tamorphosent</acronym> en cr�atures utilisant des animations _LOW.
- Correction d'un dysfonctionnement du code qui emp�chait l'installation de composants optionnels.
- Ajout de l'option d'installation des sons dans le composant � Animations de Svirfneblin �.
- Ajout du composant � Correction des r�f�rences des cr�atures dans les cartes �.
- Ajout des fichiers r�vis�s d'attribution de sons des salamandres (slots MSAL et MSA2).
- Am�lioration de la compatibilit� avec <a href="http://www.shsforums.net/topic/38261-atweaks-v264-released/">aTweaks</a>.
- Am�lioration des proc�dures de modification de cr�atures pour les d�mons et les orques chamans.


##### WeiDU Beta 2 : 23 janvier 2010
 
- Ajout de la prise en charge des syst�mes non ANSI par la proc�dure d'installation.


##### >WeiDU Beta 1 : 11 janvier 2010

- Premi�re sortie en version <acronym title="Weimer Dialogue Utility">WeiDU</acronym>.
- Toutes les cr�atures du jeu et des mods affect�es par IA sont modifi�es.
- Ajout des composants optionnels.


##### (r.10010043)

- Correction d'un bogue affectant les slots d'animation d'Icewind Dale dans Baldur's Gate II.


##### (mise � jour de la version r.09102252)

- Mise � jour de la documentation et du Reference Picker.
- Ajout d'une feuille de style alternative. &#128521;


##### (r.09102252)

- Sortie initiale.
<div style="text-align:right"><a href="#components">Retour en haut de page</a></div>
