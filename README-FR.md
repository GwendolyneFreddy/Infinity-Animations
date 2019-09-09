# <a name="top" id="top"></a>Infinity Animations (WIP : don't try to install it - it will fail)

### Un mod de Spellhold Studios pour Baldur's Gate II : <acronym title="Throne of Bhaal">ToB</acronym>, Baldur's Gate Trilogy et <acronym title="Baldur's Gate 'To Two'">Tutu</acronym>


<strong>Auteure :</strong> Erephine<br />
<strong>Code <acronym title="Weimer Dialogue Utility">WeiDU</acronym> :</strong> Miloch<br />
<strong>Version :</strong> 6.0.1 alpha<br />
<strong>Langues :</strong> <a href="README.md">anglais</a>, français<br />
<strong>Platformes :</strong> Windows, linux

<strong>Site internet du mod :</strong> <a href="http://www.spellholdstudios.net/ie/infinityanimations">Spellhold Studios</a><br />
<strong>Forum du mod :</strong> <a href="http://www.shsforums.net/forum/594-infinity-animations/">Infinity Animations</a>


<center><a href="#intro">Présentation</a> &#x2B25; <a href="#compat">Compatibilité</a> &#x2B25; <a href="#installation">Installation</a> &#x2B25; <a href="#compon">Composants</a> &#x2B25; <a href="#anims">Animations</a> &#x2B25; <a href="#credits">Crédits</a> &#x2B25; <a href="#version">Hostorique</a></center></br></br>


<hr>


## <a name="intro" id="intro"></a>Présentation

Ce mod modifie le jeu Baldur's Gate II : Trône de Bhaal de façon à ce qu'il dispose d'animations supplémentaires de créatures et de personnages (appelées « slots d'animation » dans ce document [<em>NdT : « emplacements » ou « index »</em>]). Il fournit aussi un utilitaire permettant de définir automatiquement de nouveaux slots d'animation afin de les enregistrer dans le forum d'Infinity Animations. Il fonctionne ainsi comme une base de données centralisée, utilisable par quiconque souhaite ajouter de nouvelles animations de créature dans le jeu sans être confronté à des problèmes de conflits et d'incompatibilité avec d'autres mods.

Infinity Animations prend en charge les types d'animation très divers des jeux Baldur's Gate I, Baldur's Gate II, Icewind Dale I, Icewind Dale II, Planescape: Torment et Neverwinter Nights. En bonus, le mod rétablit l'intégralité des animations de personnages de Baldur's Gate I, et permet à certaines animations qui n'en avaient pas jusqu'à présent de disposer dorénavant d'un paperdoll [<em>NdT : silhouette dans l'écran des personnages</em>].
Point important pour les joueurs installant plusieurs mods conséquents (appelés « megamods »), Infinity Animations résout les conflits de slots d'animation [<em>NdT : plusieurs mods utilisant les mêmes slots pour des animations différentes, le dernier installé écrase les modifications effectuées par les précédents</em>], et rétablit les animations de base que les megamods ont modifiées.

Enfin, il comporte des composants optionnels qui introduisent de nombreuses nouvelles animations dans le jeu, ainsi que leurs jeux de sons associés (soundsets). Bien que le nombre d'animations supportées ne soit pas « infini », comme le nom du mod l'indique, il devrait toutefois être assez important pour répondre aux besoins actuels (et probablement futurs) de tout le monde.

<strong>Principales fonctions</strong>
<ul style="margin-left: 4%;">
	<li>Rétablit les animations de personnages de Baldur's Gate I.</li>
	<li>Améliore la prise en charge des paperdolls pour les animations existantes.</li>
	<li>Ajoute des animations de jeu personnalisées pour les personnages et les créatures (dont les dragons).</li>
	<li>Permet d'utiliser de nombreux <em>types</em> d'animation (dont certains n'ont jamais été vus dans les jeux).</li>
	<li>Résout les problèmes d'empilement d'animation et les conflits de slots et de désignation des animations.</li>
	<li>Fournit un utilitaire <acronym title="Graphical User Interface">GUI</acronym> [<em>NdT : interface graphique</em>] pour vous aider à ajouter de nouvelles animations dans le jeu.</li>
	<li>Vous permet de visualiser à quel point le pourcentage de slots d'animation disponibles refuse obstinément de diminuer. &#128578;</li>
</ul>
<div style="text-align:right"><a href="#top">Retour en haut de page</a></div>


<hr>


## <a name="compat" id="compat"></a>Compatibilité

Infinity Animations fonctionne avec <acronym title="Baldur's Gate II">BG2</acronym> : Trône de Bhaal et toutes les conversions  basées sur <acronym title="Throne of Bhaal">ToB</acronym>. <strong>Assurez-vous que vous avez bien installé le patch 26498 pour le Trône de Bhaal.</strong> Si nécessaire, vérifiez le fichier Readme relatif au patch dans votre répertoire de jeu et sur le site internet de <a href="http://www.bioware.com/games/throne_bhaal/support/patches/">BioWare</a>.

Ce mod est également compatible avec les autres mods, dont <a href="http://www.pocketplane.net/tutu/">Baldur's Gate Tutu</a> (et EasyTutu), <a href="http://www.shsforums.net/index.php?showforum=261">Baldur's Gate Trilogy</a> et le <a href="http://www.shsforums.net/files/file/536-big-world-installpack/">BiG World Project</a>.

Installez-le après la plupart des autres mods, en particulier ceux qui ajoutent des créatures ou des animations, mais avant les procédures finales de « biffing ». [<em>NdT : archivage avec Generalized biffing</em>]

Commencez une nouvelle partie</strong> après avoir installé ce mod, ou si vous êtes réticent(e), installez le composant « Correction des animations dans les parties sauvegardées ».</br>
<div style="text-align:right"><a href="#top">Retour en haut de page</a></div>

		
## <a name="installation" id="installation"></a>Installation

#### Mise en garde

<em>Si une ancienne version de ce mod est déjà installée, désinstallez-la avant d'extraire la nouvelle. Pour cela, lancez <strong>setup-infinityanimations.exe</strong>, désinstallez tous les composants précédemment installés et supprimez le répertoire infinityanimations.</em>

<em>Lorsque vous installez ou désinstallez, <strong>ne fermez pas la fenêtre <acronym title="Disk Operating System">DOS</acronym></strong> en cliquant sur le bouton <strong>X</strong> ! Au lieu de cela, appuyez sur la touche <strong>Entrée</strong> lorsque l'invite de commandes vous le demande.</em>

Par précaution, <strong>désactivez les antivirus</strong> ou tout logiciel résidant en mémoire avant d'installer ce mod, ou tout autre mod. Certains (en particulier avast et Norton !) ont une fâcheuse tendance à déclarer les exécutables des mods comme des faux positifs, provoquant ainsi l'échec de la procédure d'installation.

Vous pouvez extraire les fichiers de l'archive avec <a href="http://www.rarlab.com/download.htm">WinRAR</a>, <a href="http://www.zipgenius.it/ita/?page_id=12">ZipGenius</a>, ou n'importe quel autre logiciel capable de décompresser les fichiers .rar. [<em>NdT : comme <a href="http://www.7-zip.org/">7-Zip</a></em>]

<strong>Important : </strong>Téléchargez tout le contenu dont vous avez besoin dans la section de téléchargement d'Infinity Animations de <a href="http://www.shsforums.net/index.php?autocom=downloads&showcat=98">Spellhold Studios</a>. En cas de doute, téléchargez toutes les archives (la plupart des installations de megamods les nécessitent toutes). Extrayez les archives en sélectionnant l'option « Ne pas extraire les chemins d'accès » de l'onglet <strong>Avancé</strong> de WinRAR. Assurez-vous aussi que le « Chemin d'accès de destination » de l'onglet <strong>Général</strong> se termine par <strong>/content</strong> ou <strong>/restore</strong> après <strong>infinityanimations</strong> (ils ne doivent pas comporter de sous-répertoires).

Extrayez toutes les archives dans le répertoire /content sauf IA_BG2_Restores.rar, dont les fichiers doivent aller dans le répertoire /restore. Si vous extrayez IA_Wh_Dr_Wyv_LoP.rar (à ce jour, seul le mod la Sphère Planaire en a besoin), vous pouvez supprimer le fichier The_Lady's_Shadow.rar après extraction, car il n'est pas utilisé à cause des dimensions de l'animation, trop grandes pour être supportées par le moteur du jeu.

Si vous utilisez WinZip, assurez-vous que la case « Utiliser les noms de répertoire » <em>n'est pas cochée</em>.

Une fois l'extraction terminée, les répertoires « content » et/ou « restore » devraient contenir une multitude de fichiers .bam, et AUCUN sous-répertoire. Le programme d'installation vous préviendra s'il vous manque des fichiers nécessaires. À ce moment, vous pourrez quitter le programme, télécharger le contenu manquant, l'extraire et relancer la procédure d'installation.

## 

#### Windows

Extrayez le contenu du mod dans le répertoire du jeu que vous souhaitez modifier (<acronym title="Baldur's Gate II">BG2</acronym>, <acronym title="Baldur's Gate Trilogy">BGT</acronym> ou EasyTutu). Si l'extraction s'est déroulée correctement, un répertoire infinityanimations et un fichier setup-infinityanimations.exe doivent être apparus dans le répertoire du jeu. Pour installer le mod, double-cliquez sur <strong>setup-infinityanimations.exe</strong> et suivez les instructions apparaissant à l'écran.

Pour réinstaller, désinstaller ou changer certains composants, lancez <strong>setup-infinityanimations.exe</strong> dans votre répertoire de jeu.

## 

#### Linux

Extrayez le contenu du mod dans le répertoire du jeu que vous souhaitez modifier.

Téléchargez la version la plus récente de <acronym title="Weimer Dialogue Utility">WeiDU</acronym></a> pour Linux sur <a href="http://www.weidu.org/%7Ethebigg/">WeiDU.org</a>, puis copiez WeiDU et WeInstall dans /usr/bin. Ouvrez ensuite un terminal et allez (<strong>cd</strong>) dans le répertoire d'installation de votre jeu.

<em>Facultatif : lancez « tolower » et répondez oui (« Y ») aux deux requêtes. Il n'est pas nécessaire d'exécuter la deuxième option (linux.ini) si vous l'avez déjà exécutée une fois dans le même répertoire. Pour gagner du temps, l'archive est déjà « tolower-isée », il n'y a donc pas non plus besoin d'exécuter la première option (passage des noms de fichiers en minuscules), si vous n'avez extrait que ce mod depuis la dernière fois que vous avez passé des noms de fichiers en minuscules. Si vous avez un doute, il vaut mieux exécuter tolower et accepter les deux options.</em>

Pour installer le mod, exécutez <strong>WeInstall setup-infinityanimations</strong> dans votre répertoire de jeu. Exécutez ensuite <strong>wine BGMain.exe</strong>, et commencez votre partie.

## 

#### Note pour effectuer une désinstallation complète

En plus des méthodes détaillées plus haut pour supprimer des composants, il est possible de désinstaller complètement le mod en tapant <strong>setup-infinityanimations --uninstall</strong> dans une ligne de commandes, ce qui supprimera tous les composants sans devoir ingurgiter tous les messages.</br>

## 

#### <a name="config" id="config">:warning: Avertissement : nouvelle procédure d'installation

##### Depuis la version 6.0.0, les variables nécessaires à l'installation sont lues dans le fichier <a href="../infinityanimations-default.ini"><em>infinityanimations_user.ini</em></a> ou dans le fichier <em>infinityanimations-config.ini</em>, si ce dernier existe.

Dans les versions précédentes, vous deviez téléchargez tout le contenu dont vous avez besoin dans la section de téléchargement d'Infinity Animations de <a href="http://www.shsforums.net/files/category/98-infinity-animations/">Spellhold Studios</a>, puis extraire les archives dans les sous-répertoires <strong>content</strong> ou <strong>restore</strong> du répertoire infinityanimations. Le programme d'installation vous prévenait s'il vous manquait des fichiers nécessaires. À ce moment, vous pouviez quitter le programme, télécharger le contenu manquant, l'extraire et relancer la procédure d'installation.

Dorénavant, le contenu nécessaire à l'installation de Infinity Animations est inclus dans le répertoire **archives** du mod et le composant principal le copie automatiquement dans le répertoire **override** de votre jeu. Le mod n'utilisant plus les sous-répertoires <em>content</em> et <em>restore</em>, ces derniers ont été supprimés.

Par défaut, tout le contenu du répertoire archives est installé. Si vous souhaitez limiter le contenu à installer, il vous suffit de modifier les variables concernées dans le fichier **_infinityanimations.ini_** (situé dans le répertoire infinityanimations) avec Notepad ou un autre éditeur de texte, puis de le sauvegarder sous le nom **_infinityanimations_user.ini_**.

Chaque ligne comprend une option de configuration, suivie de « = », puis d'un chiffre. Tout ce que vous avez à faire, c'est modifier la valeur du chiffre. Par exemple, si vous ne souhaitez pas utiliser les animations de svirneblins, modifiez la valeur de la variable ia_iwd_svirfneblin en 0. Si vous décidez d'installer un composant nécessitant des fichiers que vous avez choisi de ne pas installer, le programme d'installation vous préviendra de leur absence. Vous pourrez alors quitter le programme, modifier la valeur dans le fichier ini et relancer la procédure d'installation. 

Le programme d'installation lira les valeurs des variables dans les deux fichiers ini et donnera la priorité aux vôtres. Si le fichier infinityanimations_user.ini contient une valeur d'option non conforme, ou si une variable est manquante, il la remplacera par sa valeur par défaut (celle correspondant à l'installation « <em>standard</em> »).

Voici le tableau des options concernées :</br></br>

<table style="margin-left: 80px; width: 90%; " summary="Installation variables list">
	<tr style="font-size: 125%; line-height: 160%;">
		<th style="border: 1px solid #781808; text-align: center; background-color: #781808; color: #e5e5e5; ">Variable</th>
		<th style="border: 1px solid #781808; text-align: center; background-color: #781808; color: #e5e5e5; ">Description</th>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_base_anims</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content 001 - Base Content<br><br>
		- Contenu : animations de Basilic et de Tasloi, les animations manquantes de IWD référencées dans BGII (Scarabée bombardier, Scarabée de feu, Scarabée scolyte, Scarabée rhinocéros, Cyclope, Fantôme, Blême majeur, Goule majeure, Histachii, Homme lézard, Homme lézard roi, Liche blanche, Nécrophage gris/vert/jaune, Ombre petite/grande), Ombre des roches ancienne, Troll des glaces, Troll des neiges) zombi bleu/jaune), les animations de personnages de BG I. Comprend les tables et les jeux de sons des créatures concernées et les animations de cimeterre de BG1.<br>
		- Nécessaire pour les composants Morts-vivants différenciés [400], Plus d'animations de base [500], Animations de personnages de BG1 pour les PNJs [8000-8010-8020-8030] et pour les PJ exportés [9500-9510-9520].<br>
		- Nécessaire pour les mods BP, CtB, Drizzt Saga, NEJ, RoT, SOS, TDD, TS et RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_belhifet_and_marilith</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - IWD Belhifet and Marilith<br><br>
		- Contenu : animations et jeux de sons du Belhifet et de la Marilith d'IWD. Comprend les tables et les jeux de sons des créatures concernées.<br>
		- Nécessaire pour les mods Drizzt Saga, RoT, TDD, TS et TS-BP.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_bg2_restores</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - BG2 Restores<br><br>
		- Contenu : Femme araignée statique (MSPL), Goblin d'élite avec arc (MGO4), Goblin d'élite avec hache (MGO3), Liche (MLIC), Liche noire (MLER), Marilith (MTAN), Myconide bleu (MMY2), Orog (MNO1), Orog d'élite (MNO2), Orque d'élite mêlée (MOR3). Comprend les tables des jeux de sons des créatures concernées.<br>
		- Il s'agit du contenu nécessaire pour restaurer les slots d'animation de BG2 écrasés par certains mods. Il est uniquement nécessaire pour une mega installation comprenant les mods suivants : BP, BoneHill, CtB, Drizzt Saga, NEJ2, RoT, SOS, TDD, TS, TS-BP, Sheena, Planar Sphere et RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_bg2_iwd2</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content 002 - IWDII and unused BGII Animations<br><br>
		- Contenu : toutes les animations de IWD II que l'on ne trouve ni dans BGII (Ellesime avec des cheveux blancs, Géant du feu alternatif, Créature des lagons, Tyramort), ni dans IWD (Abishai blanc, Blaireau-garou, Chimère, Crochorreur, Demi-dragon noir/rouge, Drider mâle/femelle, Élémentaire de l'eau petit, Freyeur normale/grande, Géant Fomorian, Gobelins de IWD II, Gobelins chevaucheurs de worg, Gobelours, Capitaine gobelours, Isair, Kegs, Lemure, Madae, Malarite, Orog Shaman, Orques morts-vivants, Rat-garou, Tréant, Sanglier arctique, Shenrical, Worg, Yuan-Ti demi-sang). Comprend les tables et les jeux de sons des créatures concernées.<br>
		- Nécessaire pour les composants Animation d'Isair pour les cambions [210-230], Animation de Madae pour les alu-démons [260-280] et Plus d'animations d'Icewind Dale II [600].<br>
		- Nécessaire pour les mods BP, CtB, NEJ, Planar Sphere, RoT et Sheena.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_ee_tob</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - EE games new Animations ported to ToB<br><br>
		- Contenu: sanglier sauvage, gobelours chaman, soldat croisé, chien gris, dragon vert (IWD), dragon vert juvénile, dragon rouge juvénile, dragons jeunes (vert, d'argent, blanc), mort noyé rouge, ettin fantôme, démon rouge, géant des collines, Gibberling Brood, gobelins Mkhiin (commun, avec arc, avec bâton, en armure et hache, en armure et arc), gobelins chevaucheurs de worg (d'élite, chaman), golem minuscule, demi-dragon vert, hephernaan, mégalo-mille-pattes, pouding noir, magicien rouge, marin (aux habits sombres, verts, rouges), serpent aquatique, araignée aquatique, trolls (d'eau douce, spectral), ver de tunnels, grande wiverne albinos, wiverne blanche. Comprend les tables et les jeux de sons des créatures concernées.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
			</tr>
			<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_fiends_genies</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Fiends and Genies<br><br>
		- Contenu : Démon bleu, Démon vert (Nabassu), Marilith sombre, Maurezhi, Myrlochar, Dao, Dao avec jambes, Efrit, Efrit avec jambes, Jann, Jann avec jambes, Marid, Marid avec jambes, Yochlol, Reine des goules, Guenaudes (Annis, nocturne, verte, des mers). Comprend aussi les fichiers de sons pour Erinyes, Gelugon et Tieffelins.<br>
		- Nécessaire pour les composants Genies différenciés [50] et Démons différenciés [100].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_iwd</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Remaining IWD Animations<br><br>
		- Contenu : toutes les animations manquantes de IWD non comprises dans les autres archives (Élémentaire de terre/eau/feu, Sahuagin petit/grand, Armures animées bronze/sombre/verte, Arundel, Barbare Shaman (avec marteau, bâton, gourdin), Barbare guerrier (bleu, rouge, marron), Barbare Icasaracht, Belhifet prêtre, Fatalité rampante, Mort noyé, Géant du feu de IWD, Golem de fer de IWD, Rémorhaz, Seer, Yeti, Ombre des roches Vodyanoi, Verbeeg, Nécrophage des tertres). Comprend les tables et les jeux de sons des créatures concernées.<br>
		- Nécessaire pour les composants Démons différenciés [100], Morts-vivants différenciés [400], Combattants squelettes [410-415-420], Animation de pauvre hère [450-455-460] et Plus d'animations d'Icewind Dale [550].<br>
		- Nécessaire pour les mods BP, BH, CtB, NEJ, RoT, SOS et TS.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_iwd_svirfneblin</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - IWD Svirfneblin<br><br>
		- Contenu : les animations de IWD/IWD2 pour svirfneblins (gnomes des profondeurs). Par défaut, la couleur de leur peau est pâles alors que, dans les références AD&D, elle devrait être plus foncée (couleur pierre). Le jeu original comportait des variantes avec et sans pioches (mais sans animation d'arme séparée). Comme ces emplacements ne sont pas palettisés, les variantes suivantes sont disponibles (les deux dernières étant des versions personnalisées des animations pâles IWD): Svirfneblin pâle avec hache, Svirfneblin pâle sans hache, Svirfneblin foncé avec hache, Svirfneblin foncé sans hache. Comprend des jeux de sons empruntés à NWN.<br>
		- Nécessaire pour le composant Animations de svirfneblins [480-490].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_moinesse_edits_iaised</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Moinesse's Avatar Edits (IA compatible version)<br><br>
		- Contenu : Barbare humain, Druidesse humaine, Guerrière humaine, Magicienne humaine, Magicienne elfe, Voleuse humaine, Ninja humain, Vampire homme.<br>
		- Nécessaire pour le composant Avatars de Moinesse pour IA [7000-7010-7020-7030].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_nwn_01_modron</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - WoRm's NWN Ports and Alternate Modron<br><br>
		- Contenu : Modron alternatif, animations de NWN portées par WoRm (Amel, Basilic, Bebilith, Hamatula, Osyluth, Diantrefosse, Épouvantail, Vedred). Comprend les tables et les jeux de sons des créatures concernées.<br>
		- Nécessaire pour les composants Démons différenciés [100], Diantrefosses {150-175], Plus d'animations de Neverwinter Nights [650] et pour le mod RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_nwn_misc_1</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Miscellaneous NWN Animations I<br><br>
		- Contenu : Bête éclipsante, Géante du feu et du givre, Scarabée bombardier, Succube (avec les animations d'armes), l'espèce de chose bovine (ne me demandez pas pourquoi). Comprend les tables et les jeux de sons des créatures concernées.<br>
		- Nécessaire pour les composants Démons différenciés [100], Plus d'animations de Neverwinter Nights [650] et pour le mod RPG KitsPack.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_pst_abishai</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - PST Abishai<br><br>
		- Contenu : Abishai bleue, noire, rouge et verte (d'après les animations de PS:T). Comprend leurs jeux de sons.<br>
		- Nécessaire pour le composant Démons différenciés [100].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_pst_paletted</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - PST Paletted Animations<br><br>
		- Contenu : Femme Aasimar, Baurier Mâle, Catin, Citoyen et Citoyenne de Maudith, Citoyen et Citoyenne des classes supérieures, Femme et Homme poussière, Femme et homme goule, Githzerai, Homme-dieu, Citoyen et Citoyenne des classes inférieures, Magicien citoyen, Marchand, Midwife, Sicaire et Grand sicaire, Prêtre et Travailleur squelette, Thokola, Tieffelin homme et femme, Zombi femme et homme. Comprend leurs jeux de sons.<br>
		- Nécessaire pour le composant Plus d'animations de Planescape: Torment [710-720-760-740].<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_shadows_harpy_frostgiant</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - Shadows, Harpy and Frost Giant<br><br>
		- Contenu : Ombres alternatives d'IWD (« murky »), Harpie et Géant du givre d'IWD. Comprend les tables et les jeux de sons des créatures concernées.<br>
		- Nécessaire pour le composant Morts-vivants différenciés [400] et pour les mods BP, Drizzt Saga, NEJv691, RoT, TDD et TS.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
	<tr>
		<td style="border: 1px solid #781808; text-align: center; padding-top:20px; padding-bottom:20px; "><strong><span style="color: #781808;">ia_wh_dr_wyv_lop</span></strong></td>
		<td style="border: 1px solid #781808; padding-left:5px; padding-right:5px">IA Content - White Wyvern and Dragon, Lady of Pain<br><br>
		- Contenu : Dragon blanc et Wiverne majeure blanche d'IWD, Dame de la Douleur. Comprend les tables et les jeux de sons des créatures concernées.<br>
		- Nécessaire pour le mod Planar Sphere.<br><br>
		<span style="padding-left:20px;">0 = Ne pas l'installer</span><br>
		<span style="color: #781808; padding-left:20px;">1 = L'installer [par défaut]</span></td>
	</tr>
</table><br>
<div style="text-align:right"><a href="#top">Retour en haut de page</a></div>


<hr>


## <a name="components" id="components"></a>Composants

Le programme d'installation comprend les composants suivants. Chacun possède un numéro distinct et pré-défini qui lui attribue une position déterminée (<em>NdT : mot-clé DESIGNATED en langage WeiDU</em>] ; ce qui permet aux autres composants de le détecter et aux utilitaires d'installation automatiques comme le BiG World Setup de préciser quels composants installer.

Tous les sous-composants nécessitent le composant principal, car c'est lui qui installe le nouveau contenu. Tous les autres composants sont optionnels. Notez aussi qu'aucun composant n'affecte les <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym> recrutables, un point qu'il est préférable de laisser à la discrétion de chaque moddeur. Par conséquent, si un composant prétend affecter toutes les femmes Tieffelin, en aucune façon il ne modifiera l'apparence des PNJs Amber et Fade.</br>


><span style="margin-left: 50px;"><a href="#0">[0] Infinity Animations (composant principal)</a></span></br>
><span style="margin-left: 50px;"><a href="#25">[25] Correction des animations des humanoïdes</a></span></br>
><span style="margin-left: 50px;"><a href="#50">[50] Génies différenciés</a></span></br>
><span style="margin-left: 50px;"><a href="#100">[100] Démons différenciés</a></span></br>
><span style="margin-left: 50px;"><a href="#150">[150-175] Diantrefosses</a></span></br>
><span style="margin-left: 50px;"><a href="#210">[210-230] Animation d'Isair pour les cambions</a></span></br>
><span style="margin-left: 50px;"><a href="#260">[260-280] Animation de Madae pour les alu-démons</a></span></br>
><span style="margin-left: 50px;"><a href="#400">[400] Morts-vivants différenciés</a></span></br>
><span style="margin-left: 50px;"><a href="#410">[410-415-420] Combattants squelettes</a></span></br>
><span style="margin-left: 50px;"><a href="#450">[450-455-460] Animation de pauvre hère</strong> [<em>NdT : seer en anglais</em>].</a></span></br>
><span style="margin-left: 50px;"><a href="#480">[480-490] Animations de svirneblins</a></span></br>
><span style="margin-left: 50px;"><a href="#500">[500] Plus d'animations de base</a></span></br>
><span style="margin-left: 50px;"><a href="#550">[550] Plus d'animations d'Icewind Dale</a></span></br>
><span style="margin-left: 50px;"><a href="#600">[600] Plus d'animations d'Icewind Dale II</a></span></br>
><span style="margin-left: 50px;"><a href="#650">[650] Plus d'animations dee Neverwinter Nights</a></span></br>
><span style="margin-left: 50px;"><a href="#710">[710-720-730-740] Plus d'animations de Planescape: Torment</a></span></br>
><span style="margin-left: 50px;"><a href="#7000">[7000-7010-7020-7030] Avatars de Moinesse pour IA</a></span></br>
><span style="margin-left: 50px;"><a href="#8000">[8000-8010-8020-8030] Animations de personnages de BG1 pour les PNJs</a></span></br>
><span style="margin-left: 50px;"><a href="#9000">[9000] Correction des références des créatures dans les cartes</a></span></br>
><span style="margin-left: 50px;"><a href="#9500">[9500-9510-9520] Animations de personnages de BG1 pour les PJs</a></span></br>
><span style="margin-left: 50px;"><a href="#9600">[9600-9610-9620] Animations de personnages de BG1 dans les parties sauvegardées</a></span></br>
><span style="margin-left: 50px;"><a href="#9900">[9900-9910] Correction des animations dans les parties sauvegardées</a></span>

## 

<a name="0" id="0"></a><strong>0. Infinity Animations (composant principal)</strong><br />
<em><span style="margin-left: 15px;">Nécessite le patch <acronym title="Throne of Bhaal">ToB</acronym> v26498.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Vérifie la présence des fichiers nécessaires et la validité de l'exécutable.</li>
	<li>Fait une copie de sauvegarde de l'exécutable et le modifie.</li>
	<li>Remplace les animations _LOW de créatures.</li>
	<li>Met à jour les fichiers .ids.</li>
	<li>Rétablit toutes les animations écrasées par les mods.</li>
	<li>Copie les nouvelles animations (toutes celles extraites dans le répertoire /content).</li>
	<li>Corrige toutes les créatures affectées.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="25" id="25"></a><strong>25. Correction des animations des humanoïdes</strong><br />
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux guerriers humains l'animation de guerrier plutôt que celle de prêtre.</li>
	<li>Attribue aux guerriers elfes l'animation de guerrier plutôt que celle de prêtre.</li>
	<li>Attribue aux guerriers petites-personnes l'animation de guerrier plutôt que celle de prêtre.</li>
	<li>Attribue aux guerrières humaines l'animation de guerrière plutôt que celle de prêtresse.</li>
	<li>Attribue aux magiciens humains l'animation de magicien plutôt que celle de prêtre.</li>
	<li>Attribue aux magiciens elfes l'animation de magicien plutôt que celle de prêtre.</li>
	<li>Attribue aux voleurs humains l'animation de voleur plutôt que celle de guerrier.</li>
	<li>Attribue aux voleuses humaines l'animation de voleuse plutôt que celle de guerrière.</li>
	<li>Attribue aux moines humains l'animation de moine plutôt que celle de prêtre.</li>
	<li>Attribue aux pirates humains l'animation de pirate.</li>
	<li>Attribue aux marins humains l'animation de marin.</li>
	<li>Attribue aux gardes amniens l'animation de garde amnien.</li>
	<li>Attribue aux Voleurs de l'ombre humains l'animation de voleur de l'ombre.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="50" id="50"></a><strong>50. Génies différenciés</strong><br />
<em><span style="margin-left: 22px;">Nécessite l'archive IA_Fiends&#95;Genies.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Utilise les animations de djinn, d'efrit, de dao, de jann et de marid lorsqu'elles sont pertinentes.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="100" id="100"></a><strong>100. Démons différenciés</strong><br />
<em><span style="margin-left: 34px;">Nécessite les archives IA_Fiends&#95;Genies.rar, IA&#95;IWD.rar et IA&#95;PST&#95;Abishai.rar.<br></span>
<span style="margin-left: 34px;">Nécessite l'archive IA_NWN&#95;01&#95;Modron.rar seulement si certains mods sont installés.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux nabassus une animation de tanar'ri vert-gris.</li>
	<li>Attribue au Démon chromatique une animation de base un peu plus colorée [<em>NdT : bleue</em>].</li>
	<li>Attribue aux bebiliths (seulement dans les mods Longer Road et Drizzt Saga) une animation provenant de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue à certaines mariliths une animation plus sombre.</li>
	<li>Attribue aux <acronym title="Night hag">sorcières de la nuit</acronym> [<em>NdT : ou guenaudes nocturnes selon les traductions</em>] l'animation de night hag de <acronym title="Planescape: Torment">PS:T</acronym>.</li>
	<li>Attribue aux démons d'os l'animation d'osyluth de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux gélugons (seulement ceux ajoutés par un mod) l'animation de salamandre des glaces.</li>
	<li>Attribue aux yochlols (sauf celles sous l'apparence d'elfes noires) une animation d'otyugh plus foncée.</li>
	<li>Attribue aux abishaïs d'argent, verts et rouges leur animation appropriée d'<acronym title="Icewind Dale">IWD</acronym> ou de <acronym title="Planescape: Torment">PS:T</acronym>.</li>
	<li>Attribue aux manes l'animation de mort noyé d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux erinyes un avatar d'elfe dotée d'ailes noires.</li>
	<li>Attribue aux succubes l'animation de succube de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux maurezhis l'animation de maurezhi (une goule sombre).</li>
	<li>Attribue aux glabrezus la bonne animation de glabrezu.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="150" id="150"></a><strong>Diantrefosses<br />
150.</strong> Attribuer à tous l'animation de <acronym title="Neverwinter Nights">NWN</acronym>.n<br />
<strong>175.</strong> Attribuer à certains l'animation de <acronym title="Neverwinter Nights">NWN</acronym>.<br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_NWN&#95;01&#95;Modron.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Choisir un sous-composant (ou aucun). « Certains » = environ la moitié, déterminés aléatoirement.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="210" id="210"></a><strong>Animation d'Isair pour les cambions<br />
210.</strong> Pour tous les cambions.<br />
<strong>230.</strong> Pour certains cambions.<br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_BGII&#95;IWDII.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Même principe que celui du composant Diantrefosses.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="260" id="260"></a><strong>Animation de Madae pour les alu-démons<br />
260.</strong> Pour toutes les alu-démons.<br />
<strong>280.</strong> Pour certaines alu-démons.<br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_BGII&#95;IWDII.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Même principe que celui du composant Diantrefosses.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="400" id="400"></a><strong>400. Morts-vivants différenciés</strong><br />
<em><span style="margin-left: 34px;">Nécessite les archives IA&#95;Base&#95;Anims.rar, IA&#95;IWD.rar et Shadows&#95;harpy&#95;frostgiant.zip.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux banshees l'animation de <acronym title="NdT : wailing virgin">vestale gémissante</acronym>.</li>
	<li>Attribue aux crânes flottants l'animation de demi-liche.</li>
	<li>Attribue aux blêmes majeurs l'animation de blême majeure d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux fantômes classiques l'animation de fantôme d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux goules majeures l'animation de goule majeure d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue à certaines goules l'animation de reine des goules de <acronym title="Planescape: Torment">PS:T</acronym>.</li>
	<li>Attribue aux liches majeures l'animation de liche blanche d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux apparitions l'animation de <acronym title="NdT : mist creature">créature brumeuse</acronym>.</li>
	<li>Attribue aux revenants l'animation de revenant.</li>
	<li>Attribue aux démombres et aux ombre démoniaques l'animation d'ombre.</li>
	<li>Attribue aux âmes en peine l'animation de grande ombre d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux spectres l'animation <acronym title="NdT : large shadow alternate MURKY">alternative de grande ombre</acronym> d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux ombres l'animation de petite ombre d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue à certaines ombres l'animation <acronym title="NdT : small shadow alternate MURKY">alternative de petite ombre</acronym> d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux squelettes majeurs l'animation de squelette monstrueux [<em>NdT : combattant squelette</em>].</li>
	<li>Attribue aux horreurs lunaires l'animation de démon squelette [<em>NdT : démon d'os</em>].</li>
	<li>Attribue aux vampires femmes l'animation de vampire femme</li>
	<li>Attribue aux nécrophages l'animation de nécrophage gris d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux zombis vert l'animation de nécrophage vert d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux seigneurs zombi l'animation de nécrophage jaune d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux chevaliers morts-vivants et assimilés l'animation de nécrophage des tertres d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux zombis majeurs l'animation de zombi jaune d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux lacédons et aux zombis des mers l'animation de zombi bleu d'<acronym title="Icewind Dale">IWD</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="410" id="410"></a><strong>Combattants squelettes<br />
410.</strong> Animation de nécrophage des tertres [<em>NdT : Wight Barrow</em>].<br />
<strong>415.</strong> Animation de squelette normal [<em>NdT : jaune</em>].<br />
<strong>420.</strong> Animation de combattant squelette.<br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_IWD.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue l'animation sélectionnée à tous les combattants squelettes.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="450" id="450"></a><strong>Animation de pauvre hère</strong> [<em>NdT : seer en anglais</em>].<br />
450.</strong> Pour certains mendiants et esclaves.<br />
<strong>455.</strong> Pour certains mendiants.<br />
<strong>460.</strong> Pour certains esclaves.<br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_IWD.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Même principe que celui du composant Diantrefosses.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="480" id="480"></a><strong>Animations de svirneblins<br />
480.</strong> Seulement les animations.<br />
<strong>490.</strong> Les animations et les sons.<br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_IWD&#95;Svirfneblin.rar.</span><br />
<span style="margin-left: 34px;">Pas proposé si le mod Aurora's Shoes and Boots est installé (car il fait la même chose).</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue toutes les différentes animations de svirfneblin aux gnomes des profondeurs de l'Ombreterre.</li>
</ul><br />

<a name="500" id="500"></a><strong>500. Plus d'animations de base</strong><br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux histachii l'animation d'histachii d'<acronym title="Icewind Dale">IWD.</acronym></li>
	<li>Attribue aux guerriers hommes-lézards l'animation d'homme-lézard d'élite (brune).</li>
	<li>Attribue au chaman homme-lézard l'animation d'homme-lézard vert.</li>
	<li>Attribue aux chefs hommes-lézards l'animation de roi homme-lézard.</li>
	<li>Attribue aux différentes espèces de trolls leur animation appropriée (normale, bleue, des glaces, des neiges, petite).</li>
	<li>Attribue aux anciens ombres des roches l'animation d'ombre des roches anciens d'<acronym title="Icewind Dale">IWD</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="550" id="550"></a><strong>550. Plus d'animations d'Icewind Dale</strong><br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_IWD.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux armures animées les animations de<acronym title="NdT : animated plate">petites armures animées</acronym> d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux Archidruides l'animation d'Arundel d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux barbares leur animation appropriée (marron, rouge, brun et chaman).</li>
	<li>Attribue aux élémentaires majeurs différentes animations de <acronym title="Baldur's Gate II">BG2</acronym>/<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue à certains géants du feu l'animation de géant du feu d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux golems de fer l'animation de golem de fer d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux golems d'adamantine l'animation de golem de fer de <acronym title="Baldur's Gate II">BG2</acronym>.</li>
	<li>Attribue aux prêtresses sahuagins l'animation de sahuagin d'<acronym title="Icewind Dale">IWD</acronym>.</li>
	<li>Attribue aux gardes royaux sahuagins l'animation de grand sahuagin de <acronym title="Baldur's Gate II">BG2</acronym>.</li>
	<li>Attribue aux chefs sahuagins l'animation de grand sahuagin d'<acronym title="Icewind Dale">IWD</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="600" id="600"></a><strong>600. Plus d'animations d'Icewind Dale II</strong><br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_BGII&#95;IWDII.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux géants du feu majeurs et aux firbolgs l'animation alternative de géant du feu.</li>
	<li>Attribue des animations différenciées aux gobelins (chevaucheurs de worg, leaders, marrons, verts, d'élite).</li>
	<li>Attribue aux crochorreurs l'animation de crochorreur.</li>
	<li>Attribue aux druides de l'Ombre l'animation de Malarite.</li>
	<li>Attribue aux clones d'Ellesime l'animation d'Ellesime avec des cheveux blancs.</li>
	<li>Attribue aux brumes empoisonnées l'animation de <acronym title="NdT : lagoon creature">créature des lagons</acronym>.</li>
	<li>Attribue aux tyramorts l'animation de <acronym title="NdT : death tyrant">tyramort</acronym>.</li>
	<li>Attribue aux rats-garous l'animation de rat-garou.</li>
	<li>Attribue aux worgs l'animation de worg d'<acronym title="Icewind Dale II">IWD2</acronym>.</li>
	<li>Attribue aux Yuan-Ti demi-sang l'animation de yuan-ti demi-sang de <acronym title="Icewind Dale II">IWD2</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="650" id="650"></a><strong>650. Plus d'animations de Neverwinter Nights</strong><br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_NWN&#95;01&#95;Modron.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux porteurs de faux (dans <acronym title="Northern Tales of the Sword Coast">NTotSC</acronym>) l'animation de Amel de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux scarabées bombardiers (dans Big Picture) l'animation de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux basilics majeurs l'animation de basilic de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue aux modrons l'animation de modron.</li>
	<li>Attribue aux bêtes éclipsantes (dans AjocMod) l'animation de <acronym title="Neverwinter Nights">NWN</acronym>-<acronym title="Community Creature Project">CCP</acronym>.</li>
	<li>Attribue à certains géants du feu l'animation de géante du feu de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
	<li>Attribue à certains géants du froid l'animation de géante du froid de <acronym title="Neverwinter Nights">NWN</acronym>.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="710" id="710"></a><strong>Plus d'animations de Planescape: Torment<br />
710.</strong> 25 % des créatures non-recrutables concernées.<br />
<strong>720.</strong> 50 % des créatures non-recrutables concernées.<br />
<strong>730.</strong> 75 % des créatures non-recrutables concernées.<br />
<strong>740.</strong> Toutes les créatures non-recrutables concernées.<br />
<em><span style="margin-left: 34px;">Nécessite l'archive IA_PST&#95;Paletted.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux voleuses humaines l'animation de <acronym title="NdT : female Curst townie">citoyenne de Maudith</acronym>.</li>
	<li>Attribue aux voleurs humains l'animation de <acronym title="NdT : male Curst townie">citoyen de Maudith</acronym>.</li>
	<li>Attribue aux femmes moines l'animation de <acronym title="NdT : female Dustman">femme-poussière</acronym>.</li>
	<li>Attribue aux hommes moines et aux hommes-poussière l'animation d'<acronym title="NdT : male Dustman">homme-poussière</acronym>.</li>
	<li>Attribue à certaines goules l'animation de femme goule.</li>
	<li>Attribue à certaines goules l'animation d'homme goule.</li>
	<li>Attribue aux forgerons humains l'animation d'<acronym title="NdT : Godsman">homme-dieu</acronym>.</li>
	<li>Attribue aux mercenaires et bandits porteurs de hache et de marteau l'animation de <acronym title="NdT : large thug">grand sicaire</acronym>.</li>
	<li>Attribue aux mercenaires et bandits porteurs d'épée et de dague l'animation de <acronym title="NdT : small thug">sicaire</acronym>.</li>
	<li>Attribue aux paysannes humaines l'animation <acronym title="NdT : female lower-class townie">citoyenne des classes inférieures</acronym>.</li>
	<li>Attribue aux paysans humains l'animation de <acronym title="NdT : male lower-class townie">citoyen des classes inférieures</acronym>.</li>
	<li>Attribue aux marchands humains l'animation de marchand.</li>
	<li>Attribue aux marchandes humaines l'animation de <acronym title="NdT : midwife">midwife</acronym>.</li>
	<li>Attribue aux prostituées l'animation de <acronym title="NdT : harlot">catin</acronym>.</li>
	<li>Attribue aux mages squelettes l'animation de prêtre squelette.</li>
	<li>Attribue aux squelettes l'animation de <acronym title="NdT : skeleton worker">travailleur squelette</acronym>.</li>
	<li>Attribue aux femmes tieffelins l'animation de femme tieffelin.</li>
	<li>Attribue aux hommes tieffelins l'animation d'homme tieffelin.</li>
	<li>Attribue aux magiciens humains l'animation de <acronym title="NdT : townie wizard">magicien citoyen</acronym>.</li>
	<li>Attribue aux femmes nobles humaines l'animation de <acronym title="NdT : female upper-class townie">citoyenne des classes supérieures</acronym>.</li>
	<li>Attribue aux hommes nobles humains l'animation de <acronym title="NdT : male upper-class townie">citoyen des classes supérieures</acronym>.</li>
	<li>Attribue à certains zombis l'animation de femme zombi.</li>
	<li>Attribue à certains zombis l'animation d'homme zombi.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="7000" id="7000"></a><strong>Avatars de Moinesse pour <acronym title="Infinity Animations">IA</acronym><br />
7000.</strong> 25 % des créatures non-recrutables concernées.<br />
<strong>7010.</strong> 50 % des créatures non-recrutables concernées.<br />
<strong>7020.</strong> 75 % des créatures non-recrutables concernées.<br />
<strong>7030.</strong> Toutes les créatures non-recrutables concernées.<br />
<em><span style="margin-left: 44px;">Nécessite l'archive Moinesse_edits&#95;IAised.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Attribue aux barbares humains l'animation de barbare homme.</li>
	<li>Attribue aux druidesses humaine l'animation de druidesse.</li>
	<li>Attribue aux guerrières humaines l'animation de guerrière humaine.</li>
	<li>Attribue aux magiciennes elfes l'animation de magicienne elfe.</li>
	<li>Attribue aux magiciennes humaines l'animation de magicienne humaine.</li>
	<li>Attribue aux voleuses humaines l'animation de voleuse humaine (à moins qu'elles aient déjà reçu l'animation de <acronym title="NdT : female Curst townie">citoyenne de Maudith</acronym>).</li>
	<li>Attribue aux ninjas et assassins humains l'animation de ninja humain (à moins qu'ils aient déjà reçu l'animation de Voleur de l'ombre ou de <acronym title="NdT : male Curst townie">citoyen de Maudith</acronym>).</li>
	<li>Attribue aux vampires hommes l'animation de vampire de Moinesse.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="8000" id="8000"></a><strong>Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym><br />
8000.</strong> 25 % des créatures concernées.<br />
<strong>8010.</strong> 50 % des créatures concernées.<br />
<strong>8020.</strong> 75 % des créatures concernées.<br />
<strong>8030.</strong> La plupart des créatures concernées.<br />
<em><span style="margin-left: 44px;">Nécessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Utilise les animations de personnages originales de Baldur's Gate selon le choix spécifié.</li>
	<li>La dernière option est intitulée « la plupart » plutôt que « toutes » car certaines créatures sont exclues des modifications.</li>
	<li>Cela inclue les créatures utilisant des cimeterres, des katanas ou autre chose d'autre qu'un bouclier dans leur deuxième main (ou dotées de ces compétences), puisque <acronym title="Baldur's Gate">BG1</acronym> ne dispose pas de ces animations.</li>
	<li><strong>À utiliser avec précaution</strong> avec des <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym> recrutables : si ce composant ne traitera pas les personnages compétents en style de combat a deux armes ou équipés d'une seconde arme, n'essayez en aucun cas d'équiper les PNJs d'une seconde arme.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="9000" id="9000"></a><strong>9000. Correction des références des créatures dans les cartes</strong><br />
<em><span style="margin-left: 44px;">Installé par défaut.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Corrige les références aux animations de créatures modifiées dans les fichiers de cartes (.are) pour mieux les détecter.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="9500" id="9500"></a><strong>Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs<br />
9500.</strong> Demander confirmation pour chaque <acronym title="Personnage Joueur [NdT : traduction de PC, ou Player Character">PJ</acronym> exporté.<br />
<strong>9510.</strong> Demander confirmation pour les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym> posant problème.<br />
<strong>9520.</strong> Modifier tous les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym> sans demander confirmation.<br />
<em><span style="margin-left: 44px;">Nécessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Utilise les animations de personnages originales de Baldur's Gate selon le choix spécifié.</li>
	<li>La deuxième option modifie tous les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym>, mais demande une confirmation pour ceux équipés de cimeterres, de katanas ou d'autre chose d'autre qu'un bouclier dans leur deuxième main.</li>
	<li>Utiliser des cimeterres et des katanas devrait cependant fonctionner, mais ils apparaîtront comme des épées longues sur les avatars des personnages.</li>
	<li><strong>À utiliser avec précaution</strong> : n'essayez pas de porter deux armes, sinon le jeu crashera probablement.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="9600" id="9600"></a><strong>Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> dans les parties sauvegardées<br />
9600.</strong> Demander confirmation pour chaque personnage.<br />
<strong>9610.</strong> Demander confirmation pour les personnages posant problème.<br />
<strong>9620.</strong> Modifier tous les personnages sans demander confirmation.<br />
<em><span style="margin-left: 44px;">Nécessite l'archive IA_Base&#95;Anims.rar.</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Mêmes remarques que pour le composant précédent.</li>
	<li>Vous devrez décider de patcher ou non chaque partie sauvegardée (et le personnage qu'elle contient, si vous avez choisi l'une des options de confirmation).</li>
	<li><strong>Faites une copie de vos parties sauvegardées</strong> avant de désinstaller ce composant, car sa désinstallation restaurera les versions présentes lorsque vous l'avez installé.</li>
</ul>

<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>

## 

<a name="9900" id="9900"></a><strong>Correction des animations dans les parties sauvegardées<br />
9900.</strong> Corriger uniquement les animations _LOW.<br />
<strong>9910.</strong> Corriger toutes les animations que <acronym title="Infinity Animations">IA</acronym> a modifiées.
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>La première option empêche les crashs du jeu dus au déplacement des slots d'animation _LOW.</li>
	<li>La seconde option fait la même chose, et modifie aussi dans vos parties sauvegardées toutes les animations qui ont été modifiées.</li>
	<li>Vous devrez décider de patcher ou non chaque partie sauvegardée.</li>
	<li>Si vous avez commencé une nouvelle partie après avoir installé ce mod, alors ce composant n'est pas nécessaire (à moins que vous ne commenciez dans la section <acronym title="Baldur's Gate II">BG2</acronym> de <acronym title="Baldur's Gate Trilogy">BGT</acronym>).</li>
	<li><strong>Faites une copie de vos parties sauvegardées</strong> avant de désinstaller ce composant, car sa désinstallation restaurera les versions présentes lorsque vous l'avez installé.</li>
</ul>
<div style="text-align:right"><a href="#components">Retour à la liste des composants</a></div>


<hr>


## <a name="credits" id="credits"></a>Crédits et remerciements

#### Auteure : <a href="http://www.shsforums.net/user/2954-erephine/">Erephine</a>


#### Special Acknowledgements to

- Codage <acronym title="Weimer Dialogue Utility">WeiDU</acronym> : <a href="http://www.shsforums.net/user/5803-miloch/">Miloch</a>.
- Assistance : <a href="http://www.shsforums.net/user/948-arkenor/">Arkenor</a> et <a href="http://www.shsforums.net/user/4994-sergis/">SergIS</a>.
- Hébergement : <a href="http://www.spellholdstudios.net/">Spellhold Studios</a> (<a href="http://www.shsforums.net">Forums</a>).
- etc.


#### Logiciels et outils utilisés pour la création de ce mod

- <a href="http://www.weidu.org/%7Ethebigg/"><acronym title="Weimer Dialogue Utility">WeiDU</acronym></a> de Wes Weimer, the bigg et Wisp
- <a href="https://gibberlings3.github.io/iesdp/"><acronym title="Infinity Engine Structures Description Project">IESDP</acronym></a> maintenu par igi et lynx
- <a href="http://forums.pocketplane.net/index.php/topic,25153.msg314249.html#msg314249">Near Infinity</a> de Jon Olav Hauglid, FredSRichardson et Argent77
- <a href="http://www.gibberlings3.net/tools/dltcep.php"><acronym title="Dragonlance Total Conversion Editor Pro">DLTCEP</acronym></a> de Avenger
- <a href="http://www.teambg.eu/?page=tools&amp;cat=32">BAM Workshop</a> de Glenn Flansburg
- <a href="http://www.editpadpro.com/editpadclassic.html">EditPad Classic</a> de Jan Goyvaerts
- <a href="http://www.pspad.com/en/">PSPad</a> de Jan Fiala
- <a href="http://notepad-plus-plus.org/">Notepad++</a> par l'équipe de Notepad++, Don Ho ; et le plug-in de correction orthographique
- <a href="http://www.shsforums.net/files/file/1048-weidu-highlighter-for-notepad/">WeiDU Notepad++ Highlighters </a> de Argent77


#### Copyrights

###### Ce travail (y compris l'intégralité du code et de la documentation) est déposé sous la licence <a href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-Noncommercial 3.0 Unported License</a>. Vous êtes libre de partager (copier, distribuer et transmettre) et de modifier (adapter) ce travail, sauf à des fins commerciales. Pour plus de détails, consultez la licence <a href="http://creativecommons.org/licenses/by-nc/3.0/legalcode">Creative Commons Public License</a>. Veuillez informer les auteurs de tout changement ou toute mise à jour du mod sur le <a href="http://www.shsforums.net/forum/594-infinity-animations/">forum</a> du mod.
###### Tous les copyrights et marques déposées sont la propriété de leurs propriétaires respectifs.
<div style="text-align:right"><a href="#top">Retour en haut de page</a></div>


<hr>


## <a name="versions" id="versions"></a>Historique des versions

##### Version 6 : jour mois 2019

- Principales mises à jour :
    - Modification du code des animations pour les rendre compatibles avec les code pages non occidentaux (suppression de la procédure automatique de changement de code page dans le patch de l'exécutable). &#128521;
	- Dorénavant, Infinity Animations est livré avec l'ensemble des animations de créatures disponibles. Il n'est donc plus nécessaire de télécharger tous leurs fichiers d'archives, mais vous pouvez toujours sélectionner celles que vous souhaitez installer. Pour de plus amples précisions sur la manière de personnaliser leur installation, veuillez consulter ce <a href="#config">chapitre</a>.
	- Ajout d'une nouvelle catégorie de contenu (animations de EE pour ToB) : sanglier sauvage, gobelours chaman, soldat croisé, chien gris, dragon vert (IWD), dragon vert juvénile, dragon rouge juvénile, dragons jeunes (vert, d'argent, blanc), mort noyé rouge, ettin fantôme, démon rouge, géant des collines, Gibberling Brood, gobelins Mkhiin (commun, avec arc, avec bâton, en armure et hache, en armure et arc), gobelins chevaucheurs de worg (d'élite, chaman), golem minuscule, demi-dragon vert, hephernaan, mégalo-mille-pattes, pouding noir, magicien rouge, ùarin (aux habits sombres, verts, rouges), serpent aquatique, araignée aquatique, trolls (d'eau douce, spectral), ver de tunnels, grande wiverne albinos, wiverne blanche. Comprend les tables et les jeux de sons des créatures concernées.
- Intégration des correctifs de code et des animations du BWP Fixpack :
    - Composant principal : <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-12#entry562939">Correctif par Lollorian des goules transformées en golems</a> et <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-35#entry579291">patch de Lollorian pour les installations non-biffées</a>. Source : <a href="https://github.com/BigWorldProject/Big-World-Fixpack/commit/5ff3f32fda8f22711b55cf5065dca194d52cbffd">commit</a>.
	- Composant « Plus d'animations de More Planescape: Torment » [710-720-760-740] : <a href="http://www.shsforums.net/topic/45383-infinity-animations-from-pst/page-3#entry534274">Mise à jour par Miloch's du fichier t-pstanims.tpa</a>, améliorée par <a href="http://www.shsforums.net/topic/55059-error-installing-ia-read-out-of-bounds/?p=544741">Lollorian</a>.
	- Réparti dans plusieurs composants : <a href="http://www.shsforums.net/topic/43531-ia-comments/page-3#entry549298">patch de correction des typos dans les boucles par Lollorian</a>.
- Archive IA Shadows_Harpy_Frostgiant : Correction des noms des répertoires et des fichiers 2da des animations alternatives de petite et de grande ombre qui étaient interverties (petite = 3bt / grande = 3bu), et correction du fichier t-anisnd.tpa qui intervertissait les deux entrées.
- Intégration des correctifs graphiques des animations du BWP Fixpack (merci à leurs auteurs !) :
    - Archive IA base_anims : Correctifs des <a href="http://www.shsforums.net/topic/47692-fixed-lizardman-shaman-bug/">animations manquantes des hommes lézards (verts) quand ils lancent un sort avec des armes</a> de Miloch et <a href="https://www.gibberlings3.net/forums/topic/23792-doppelganger-animations/">Meilleures animations d'attaque du Doppelganger</a> de Polytope.
	- Archive IA_BGII_IWDII : Correctif par Gwendolyne de l'<a href="http://www.shsforums.net/topic/55742-fixed-small-elemental-water-bug/">animation de mort du petit élémentaire d'eau d'IWD2</a>.
    - Archive IA_IWD : Correctif par Miloch des <a href="http://www.shsforums.net/topic/53322-sahuagin-bug/?p=530224">sahuagins portant une arbalète qui faisaient crasher le jeu en marchant</a>.
    - Archive IA_NWN_01_modron : Correctif par Gwendolyne de l'animation de <a href="http://www.shsforums.net/topic/56013-fixed-basilisk-nwn-bug/">basilic de NWN</a>.
	- Archive NWN_Misc_I : Correctif par Gwendolyne de l'animation de <a href="http://www.shsforums.net/topic/55823-fixed-bovine-thing-axe-bug/">l'espèce de chose bovine</a>.
- Ajout des animations manquantes de lancement de sort (fichiers bam ca et sp, avec les armes quand nécessaire) :
	- Archive IA base_anims: scarabées (bombardier, scolyte, de feu, rhinocéros), cyclope, ettin, fantôme, blême majeur, goule majeure, gobelins (avec hache, avec arc, d'élite avec hache, d'élite avec arc), golem de glace, Histachii, minotaure, momie, orque (mêlée, archer, d'élite, archer d'élite), orog, orog d'élite, chef orog, salamandre (du feu, du givre), ombre (petite, grande), squelette démon, combattant squelette, troll (bleu, des glaces, des neiges), esprit des eaux, yuan-ti, yuan-ti d'élite, zombi (bleu, jaune).
	- Archive IA BGII_IWDII : sanglier arctique, gobelours, capitaine gobelours, tréant, petit élémentaire d'eau, géant fomorian, gobelins (vert avec hache, vert avec arc, capitaine, d'élite vert avec hache, d'élite vert avec arc, chevaucheur de worg, capitaine chevaucheur de worg), crochorreur, kegs, lémure, orque mort-vivant avec hache, blaireau-garou, rat-garou, worg
	- Archive IA IWD : petites armures animées (bronze/sombre/verte), barbare guerrier (bleu, rouge, marron), fatalité rampante, mort noyé, élémentaire (de terre, de feu, d'eau), géant du feu, géant verbeeg, nécrophage des tertres, rémorhaz, yeti.
	- Archive IA Shadows_Harpy_Frostgiant : ombres alternatives (« murky »), géant du givre.
- Corrections de composants :
	- Composant principal : <a href="http://www.shsforums.net/topic/45925-pst-animations-and-circus-orcs/">Suppression par Miloch de la classe d'innocent des orques et ogres du cirque de la Promenade de Waukyne</a>, correction des bugs des animations de <a href="http://www.shsforums.net/topic/48626-cyclops-bug/">cyclope</a> et de <a href="http://www.shsforums.net/topic/47995-zombie/">zombi jaune</a> qui n'étaient pas réinitialisées en cas de méga-installation.
	- Mise à jour du composant « Démons différenciés [100] : suppression d'un code de compatibilité avec stratagems intégré par SCSII depuis la version 13 (février 2010 : « <em>Avoided a possible clash with other mods by replacing the Abishai in Diathya's group in a more compatibility-friendly way</em> »).
	- Composants « Morts-vivants différenciés » [400], « Combattants squelettes » [410-415-420] et « Plus d'animations de More Planescape: Torment » [710-720-760-740] : intégration du <a href="http://www.shsforums.net/topic/54249-colors-problem-solved/?p=535498">patch glowcheck de Turambar</a> qui empêche les squelettes ayant des animations différentes de briller en rouge.
	- Correction du composant « Animation de pauvre hère » [450-455] : les listes de créatures à modifier des sous-composants « <em>Pour certains mendiants et esclaves</em>) » et « <em>Pour certains mendiants</em>) » étaient interverties. &#128541;
	- Composant « Animations de svirneblins » [480-490] : utilisation de la nouvelle variable t-svi dans une routine unique pour les deux sous-composants.
	- Composant « Avatars de Moinesse pour IA » [7000-7010-7020-7030] : intégration du <a href="http://www.shsforums.net/files/file/967-ia-patch-b5-moinesse-ninja-fix/">correctif de Miloch pour les ninja de Moinesse</a>, nécessaire si Infinity Animations et le mod Angelo sont installés ensemble.
	- Composant « Correction des références des créatures dans les cartes » [9000] : dans certaines zones, le patch précédent empêchait certaines cinématiques de se déclencher à cause d'une mauvaise attribution de noms à certaines créatures. Source : <a href="http://www.shsforums.net/topic/50797-fix-area-creature-references-causing-script-problems/">Broken creature references</a>.
	- Les composants « Correction des animations dans les parties sauvegardées » [9900-9910] et « Animations de personnages de BG1 dans les parties sauvegardées » [9600-9610-9620] ne devraient plus planter l'installation si les répertoires \save ou \mpsave n'existent pas.
- Découpage du code en composants distincts pour offrir une meilleure lisibilité.
- Déplacement des fichiers tpa (code des composants) dans le nouveau répertoire « components » et conservation des fonctions et des macros dans le répertoire « lib ».
- Adaptation du code pour une future compatibilité du mod avec les versions EE, avec notamment l'harmonisation des noms des animations.
- Ajout de commentaires dans les fichiers de code chaque fois que possible.
- Simplification du code :
    - Utilisation de nouvelles fonctions de <acronym title="Weimer Dialogue Utility">WeiDU</acronym> (qui n'existaient pas lorsque Erephine a écrit ce mod) et remplacement de fonctions obsolètes (comme DECOMPILE_BCS_TO_BAF et DECOMPILE_DLG_TO_D).
    - Utilisation de ps_recursive_copy.tpa, une nouvelle bibliothèque de fonctions WeiDU créée par <a href="http://www.shsforums.net/user/10485-sam/">Sam</a>, qui cherche de manière récursive des fichiers dans un répertoire parent, puis les copie dans un autre répertoire.
    - Corrections mineures...
- Fichier setup-infinityanimations.tp2 renommé infinityanimations.tp2 pour une meilleure intégration dans le projet « Project Infinity » d'AL|EN.
- Ajout du fichier de meta-données infinityanimations.ini pour intégration dans le projet « Project Infinity » d'AL|EN.
- Réécriture de l'utilitaire IA Reference Picker et mise à jour de sa documentation.
- Mise à jour du readme (IA prend désormais en compte la documentation traduite, ajout de nouvelles illustrations d'animations...).
- Ajout de la traduction française (Gwendolyne).
- Traification.
- Mise à jour de <acronym title="Weimer Dialogue Utility">WeiDU</acronym> (v246).


##### WeiDU Beta 5: 12 May 2010

- Changed the .exe patch so that it forces a code page change and reboots if a non-Western code page is detected
- Updated the .exe patch so that it recognises <acronym title="Baldur's Gate">BG1</acronym> thief avatars
- Cloned missing animation tables from the unmodded game
- Added other missing animation tables to base content folder
- Adding missing minotaur and water weird sounds
- Disabled problematic stacked animations from chitin.key
- Added creature sounds where relevant (major update here)
- Fixed a <a href="http://www.shsforums.net/topic/44716-error-installing/?p=483927">minor READ_BYTE glitch</a> in creature patching
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


##### WeiDU Beta 4 : 7 février 2010

- Ajout du composant « Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Non Joueurs [NdT : traduction de NPC, ou Non-Player Characters]">PNJs</acronym> ».
- Ajout du composant « Animations de personnages de <acronym title="Baldur's Gate">BG1</acronym> pour les <acronym title="Personnages Joueurs [NdT : traduction de PC, ou Player Characters">PJs</acronym> ».
- Modification de la procédure de modification des démons.


##### WeiDU Beta 3 : 1er février 2010
 
- Correction des bugs d'animations _LOW qui causaient des crashs de zones au chargement.
- Correction des scripts et des dialogues qui <acronym title="Polymorph">métamorphosent</acronym> en créatures utilisant des animations _LOW.
- Correction d'un dysfonctionnement du code qui empêchait l'installation de composants optionnels.
- Ajout de l'option d'installation des sons dans le composant « Animations de Svirfneblin ».
- Ajout du composant « Correction des références des créatures dans les cartes ».
- Ajout des fichiers révisés d'attribution de sons des salamandres (slots MSAL et MSA2).
- Amélioration de la compatibilité avec <a href="http://www.shsforums.net/topic/38261-atweaks-v264-released/">aTweaks</a>.
- Amélioration des procédures de modification de créatures pour les démons et les orques chamans.


##### WeiDU Beta 2 : 23 janvier 2010
 
- Ajout de la prise en charge des systèmes non ANSI par la procédure d'installation.


##### >WeiDU Beta 1 : 11 janvier 2010

- Première sortie en version <acronym title="Weimer Dialogue Utility">WeiDU</acronym>.
- Toutes les créatures du jeu et des mods affectées par IA sont modifiées.
- Ajout des composants optionnels.


##### (r.10010043)

- Correction d'un bogue affectant les slots d'animation d'Icewind Dale dans Baldur's Gate II.


##### (mise à jour de la version r.09102252)

- Mise à jour de la documentation et du Reference Picker.
- Ajout d'une feuille de style alternative. &#128521;


##### (r.09102252)

- Sortie initiale.
<div style="text-align:right"><a href="#top">Retour en haut de page</a></div>
