local L = LibStub("AceLocale-3.0"):NewLocale("GDKPd", "frFR")
if not L then return end

L["Allow multiple simultanous auctions"] = "Autoriser les ventes aux enchères multiples simultanées"
L["Always show the \"Hide\" button on bid frames"] = "Toujours afficher le bouton \"Cacher\" sur les cadres d'offre"
L["Amount"] = "Somme"
L["Anchor balance window to status window"] = "Ancrer la fenêtre de solde à la fenêtre de statut"
L["Announce auction start to raid warning"] = "Annoncer le début de la vente sur l'Avertissement raid"
L["Announce & auto-auction"] = "Annonce & enchères auto."
L["Announce bids to raid warning"] = "Annoncer les offres sur l'Avertissement raid"
L["Announce loot"] = "Annoncer butin"
L["Announce the current pot amount after each auction"] = "Annoncer le montant actuel de la cagnotte après chaque vente"
L["Any money subtracted from raid members is added to the pot and vice versa"] = "Tout argent soustrait aux membres du raid est ajouté à la cagnotte et vice et versa."
L["Appearance options"] = "Apparence"
L["Are you sure you want to mail %s gold to player %s?"] = "Êtes-vous sûr de vouloir envoyer %s pièces d'or au joueur %s ?"
L["Auction bid timeout refresh"] = "Taux de rafraîchissement du délai d'attente des offres"
L["Auction history"] = "Historique des ventes aux enchères"
L["Auction note: %s"] = "Note de vente aux enchères : %s"
L["Auction timeout"] = "Délai d'attente des enchères"
L["Auto-award loot to winner"] = "Récompenser automatiquement les vainqueurs avec le butin"
L["Auto bid"] = "Offre auto."
L["Award loot to Master Looter when auto-auctioning"] = "Donner le butin au Maître du butin lors des enchères auto."
L["Balance"] = "Solde"
L["Behaviour options"] = "Comportement"
L["Bid"] = "Offre"
L["Bid button re-enable delay"] = "Délai de réactivation du bouton d'offre"
L["Broadcast rules"] = "Diffusion des règles"
L["Cancel auction"] = "Annuler l'enchère"
L["Cannot start auction without Master Looter privileges."] = "Impossible de lancer une vente aux enchères sans être le Maître du butin."
L[" |cffaa0000(Distribute: %dg)|r"] = " |cffaa0000(Répartition : %do)|r"
L["Control panel scale"] = "Échelle du panneau de contrôle"
-- L["Countdown timer announce interval"] = "Countdown timer announce interval"
L["Current bid: "] = "Offre actuelle : "
L["Distribute"] = "Répartir"
L["Do not announce"] = "Ne pas annoncer"
L["Do you want to save your pot or reset without saving? You can also add a note to the pot."] = "Voulez-vous sauvegarder votre cagnotte ou la réinitialiser sans sauvegarder ? Vous pouvez également ajouter une note à la cagnotte."
--[==[ L[ [=[Due to the changes to the addon message system implemented in patch 4.2, GDKPd is no longer able to communicate using its old version checking standard.
Thus, this version of GDKPd will only be able to send and receive version checks from and to versions 1.2.0 and above of GDKPd.
While all other functionalities of GDKPd should still be compatible with previous versions, we |cffff0000strongly recommend updating GDKPd to version 1.2.0 or above|r.]=] ] = [=[Due to the changes to the addon message system implemented in patch 4.2, GDKPd is no longer able to communicate using its old version checking standard.
Thus, this version of GDKPd will only be able to send and receive version checks from and to versions 1.2.0 and above of GDKPd.
While all other functionalities of GDKPd should still be compatible with previous versions, we |cffff0000strongly recommend updating GDKPd to version 1.2.0 or above|r.]=] ]==]
L["Enable"] = "Activer"
L["Enter the amount you want to add to player %s:"] = "Entrez le montant que vous souhaitez ajouter au joueur %s :"
L["Enter the amount you want to add to the pot:"] = "Entrez le montant que vous souhaitez ajouter à la cagnotte :"
L["Enter the amount you want to subtract from player %s:"] = "Entrez le montant que vous souhaitez soustraire au joueur %s :"
L["Enter the amount you want to subtract from the pot:"] = "Entrez le montant que vous souhaitez soustraire de la cagnotte :"
L["Enter the maximum amount of money you want to bid on %s:"] = "Entrez le montant maximal que vous souhaitez offrir sur %s :"
L["Export"] = "Exporter"
L["Frame alpha"] = "Transp. du cadre"
L["Frame scale"] = "Échelle du cadre"
L["GDKPd auction history"] = "Historique des ventes aux enchères GDKPd"
L["GDKPd auction history for %s"] = "Historique de vente aux enchères GDKPd pour %s"
L[ [=[GDKPd: Drag to move
/gdkpd and check "Lock" to hide]=] ] = [=[GDKPd : Saisir pour déplacer
/gdkpd et cherchez "Verrouiller" pour cacher]=]
L["Loot dropped: "] = "Butin tombé : "
L["GDKPd: No detailed data available"] = "GDKPd : aucune données détaillées disponibles."
L["This raid uses GDKPd to faciliate its GDKP bidding process. While you can bid on items without having GDKPd installed, installing it provides you with a GUI bidding panel, auto bidding functions, auction timers, chat filtering and more!"] = "Ce raid utilise GDKPd pour faciliter le processus d'enchères GDKP. Bien que vous puissez faire des offres sur les objets sans avoir GDKPd, son installation vous fournit un panneau d'enchères graphique, des fonctions d'offres automatiques, la durée des enchères, le filtrage de la fenêtre de discussion, et bien plus !"
L["GDKPd version %s. Packaged %s."] = "GDKPd version %s. Généré le %s."
L["Your version of GDKPd is outdated and no longer compatible with the raid leader's in one or more functionalities. In order to ensure smooth performance, please update GDKPd."] = "Votre version de GDKPd est périmée et n'est plus compatible avec celle du chef de raid dans une ou plusieurs de ses fonctionnalités. Pour une utilisation optimale, il est vivement conseillé de mettre à jour GDKPd."
L["Your version of GDKPd is slightly outdated compared to the raid leader's. Full compability should be possible, however, you might want to take some time and update GDKPd."] = "Votre version de GDKPd est légèrement plus ancienne que celle du chef de raid. La compatibilité complète devrait être possible, mais il est cependant recommandé de mettre à jour GDKPd de votre côté."
L["Hide"] = "Cacher"
L["Hide 'Auction cancelled' announcements"] = "Cacher les annonces du type 'Enchère annulée'"
L["Hide 'Auction cancelled' announcements from raid warning"] = "Cacher les annonces du type 'Enchère annulée' de l'Avertissement raid"
L["Hide 'Auction finished' announcements"] = "Cacher les annonces du type 'Vente aux enchères terminée'"
L["Hide 'Bidding starts' announcements"] = "Cacher les annonces du type 'Début des enchères'"
L["Hide 'Bidding starts' announcements from raid warning"] = "Cacher les annonces du type 'Début des enchères' de l'Avertissement raid"
L["Hide chat messages"] = "Messages de la fenêtre de discussion"
L["Hide 'Current pot:' announcements"] = "Cacher les messages du type 'Cagnotte actuelle'"
L["Hide frames in combat"] = "Cacher les cadres en combat"
L["Hide history window"] = "Cacher la fenêtre de l'historique"
L["Hide 'New highest bidder' announcements"] = "Cacher les annonces du type 'Nouveau plus offrant'"
L["Hide players' bid messages"] = "Cacher les messages des offres des joueurs"
L["Hide status and balance windows"] = "Cacher les fenêtres de statut et de solde"
L["Hide 'Time remaining' announcements"] = "Cacher les annonces du type 'Temps restant'"
L["Hide version check window"] = "Cacher la fenêtre de vérification des versions"
L["Highest bidder: %s"] = "Plus offrant : %s"
L["History"] = "Historique"
L["iLvL ranges"] = "Plages ILvL"
L["Item level settings"] = "Param. niveau d'objet"
L["Item settings"] = "Param. d'objet"
L["Itm"] = "Objet"
-- L["Link raid member balance to pot"] = "Link raid member balance to pot"
L["Lock"] = "Verr."
L["Mail"] = "Courrier"
-- L["Mail money"] = "Mail money"
L["Manual adjustment"] = "Ajustement manuel"
L["Minimum bid: "] = "Offre minimale : "
L["Minimum increment"] = "Incrémentation minimale"
L["Minimum quality"] = "Qualité minimale"
L["Min increment"] = "Incrémentation min."
L["Notification options"] = "Options de notification"
L["Notify outdated versions"] = "Prévenir les périmés"
L["Notify outdated versions that are compatible with your version"] = "Notifier les versions périmées qui sont compatibles avec la votre"
L["Notify outdated versions that aren't compatible with your version"] = "Notifier les versions périmées qui sont incompatibles avec la votre"
L["Notify raid members that do not have GDKPd installed"] = "Notifier les membres du raid qui n'ont pas installé GDKPd"
L["Per-item settings"] = "Param. par objet"
L["Player balance"] = "Solde du joueur"
L["Please enter the itemID of an item you want to drop here:"] = "Veuillez entrer l'ItemID d'un objet que vous souhaitez voir tomber ici :"
L["Pot export"] = "Exportation de la cagnotte"
L["Pot size: %d|cffffd100g|r"] = "Taille de la cagnotte : %d|cffffd100o|r"
L["Prevent dragging and hide anchor"] = "Empêche le déplacement du cadre et cache l'ancre."
L["Request version data"] = "Récupérer les versions"
L["Require confirmation when mailing pot shares"] = "Demander confirmation lors de l'envoi de la part de la cagnotte"
L["Restart auction"] = "Relancer l'enchère"
-- L["Revert highest bid"] = "Revert highest bid"
L["Rules"] = "Règles"
L["Second bidder share"] = "Part du second enchérisseur"
L["Show"] = "Afficher"
L["Show addon frames"] = "Affiche les cadres de l'addon."
L["Show auction duration spiral"] = "Afficher la spirale de durée de la vente aux enchères"
L["Show countdown text on auction duration spiral"] = "Afficher le compte à rebours sur la spirale de durée des enchères"
L["Starting bid"] = "Offre de départ"
L["Stop bid"] = "Arrêter offre"
L["The amount of seconds between each announcement of the remaining time"] = "Le nombre de secondes entre chaque annonce du temps restant."
L["The amount of seconds that have to pass after a bid before the auction is closed"] = "Définit la durée en secondes après une offre avant que la vente aux enchères ne se termine."
L["The amount of seconds that have to pass before the auction is closed without bids recieved"] = "Définit le nombre de secondes qui doivent s'écouler avant que la vente aux enchères ne soit close quand aucune offre n'est soumise."
L["Third bidder share"] = "Part du troisième enchérisseur"
L["This player does not have GDKPd running or his version of GDKPd does not yet support version checks."] = "Ce joueur n'utilise pas GDKPd ou sa version ne supporte pas encore les vérifications de versions."
L["This player has the same version of GDKPd as you do. Full compability is ensured."] = "Ce joueur possède la même version de GDKPd que vous. La pleine compatibilité est assurée."
L["This player's version of GDKPd is more advanced than yours. Please consult your Curse Client for updates or manually check the curse.com page."] = "La version de GDKPd de ce joueur est plus récente que la votre. Veuillez mettre à jour via le client Curse ou rendez-vous sur la page curse.com de l'addon."
L["This player's version of GDKPd is outdated and one or more functionalities are not compatible:"] = "La version de GDKPd de ce joueur est périmée et une ou plusieurs fonctionnalités ne sont pas compatibles :"
L["This player's version of GDKPd is outdated. However, their version should be fully compatible with yours."] = "La version de GDKPd de ce joueur est périmée. Cependant, cette version devrait être pleinement compatible avec la votre."
L["This version of GDKPd was never functional due to internal errors."] = "Cette version de GDKPd n'a jamais été fonctionnelle suite à des erreurs internes."
L["This version's player balance window will be unable to recognize distributions by you."] = "La version de la fenêtre de solde de ce joueur ne pourra pas reconnaître vos distributions."
L["This version will be unable to recognize auctions cancelled by you."] = "Cette version sera incapable de reconnaître les enchères que vous annulez."
L["This version will be unable to recognize auctions started by you."] = "Cette version sera incapable de reconnaître les enchères que vous lancez."
L["This version will be unable to recognize version check requests by you. Version check requests sent by this version of GDKPd will not be answered."] = "Cette version sera incapable de reconnaître les requêtes de vérification des versions de votre part. Les requêtes de vérification des versions envoyées par cette version de GDKPd ne recevront pas de réponse." -- Needs review
L[ [=[This will completely wipe your auction history and is IRREVERSIBLE.
Are you completely SURE you want to do this?]=] ] = [=[Ceci va complètement effacer votre historique de vente aux enchères et est IRRÉVERSIBLE.
Êtes-vous CERTAIN de vouloir faire cela ?]=]
L["Toggle zero balance"] = "Solde zéro on/off"
L["Use looting system loot threshold setting"] = "Utiliser les paramètres du seuil du système de butin"
-- L["Use slim bidding window even while Master Looter"] = "Use slim bidding window even while Master Looter"
L["Version notifications"] = "Notifications de versions"
L["Versions"] = "Versions"
L["Version status for player %s"] = "Statut de la version du joueur %s"
L["Visibility settings"] = "Param. de visibilité"
--[==[ L[ [=[WARNING!

If you use the slim bidding frame, you will be unable to cancel auctions and revert bids!
Are you certain you want to do this?]=] ] = [=[WARNING!

If you use the slim bidding frame, you will be unable to cancel auctions and revert bids!
Are you certain you want to do this?]=] ]==]
L["Wipe history"] = "Effacer historique"
L[ [=[You have looted a monster!
Do you want GDKPd to announce loot?]=] ] = [=[Vous ramassez le butin d'un monstre !
Souhaitez-vous que GDKPd annonce le butin ?]=]
L[ [=[You have selected the current pot, size %d gold.
What do you want to do with this pot?]=] ] = [=[Vous avez choisi la cagnotte actuelle, contenant %d or.
Que souhaitez-vous faire avec cette cagnotte ?]=]
L[ [=[You have selected the following pot:
%s, dated %s, size %d gold.
What do you want to do with this pot?]=] ] = [=[Vous avez sélectionné la cagnotte suivante :
%s, datée du %s, %d or.
Que souhaitez-vous faire avec cette cagnotte ?]=]
