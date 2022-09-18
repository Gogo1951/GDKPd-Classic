local L = LibStub("AceLocale-3.0"):NewLocale("GDKPd", "deDE")
if not L then return end

L["Allow multiple simultanous auctions"] = "Mehrere Auktionen gleichzeitig erlauben"
L["Always show the \"Hide\" button on bid frames"] = "Den \"Verstecken\"-Knopf auf Bietfenstern immer anzeigen"
L["Amount"] = "Menge"
L["Anchor balance window to status window"] = "Kontostandfenster an Statusfenster anbinden"
L["Announce auction start to raid warning"] = "Auktionsbeginn an Schlachtzugwarnung melden"
L["Announce & auto-auction"] = "Melden & auto-versteigern"
L["Announce bids to raid warning"] = "Gebote an Schlachtzugswarnung melden"
L["Announce loot"] = "Beute bekanntgeben"
L["Announce the current pot amount after each auction"] = "Momentanen Topf nach jeder Auktion bekanntgeben"
L["Any money subtracted from raid members is added to the pot and vice versa"] = "Von Mitgliedern abgezogenes Gold wird dem Topf hinzugefügt (und umgekehrt)"
L["Appearance options"] = "Aussehensoptionen"
L["Are you sure you want to mail %s gold to player %s?"] = "Sicher, dass %s gold an Spieler %s geschickt werden soll?"
L["Auction bid timeout refresh"] = "Auktionsauslauf-Erneuerungszeit"
L["Auction history"] = "Auktionsliste"
L["Auction note: %s"] = "Auktionsnotiz: %s"
L["Auction timeout"] = "Auktions-Ablaufzeit"
L["Auto-award loot to winner"] = "Beute dem Sieger automatisch zuteilen"
L["Auto bid"] = "Auto-bieten"
L["Award loot to Master Looter when auto-auctioning"] = "Beim automatischen Versteigern Beute an Plündermeister vergeben"
L["Balance"] = "Kontostand"
L["Behaviour options"] = "Verhaltensoptionen"
L["Bid"] = "Bieten"
L["Bid button re-enable delay"] = "Aktivierungsverzögerung für Bietknopf"
L["Broadcast rules"] = "Regeln bekanntgeben"
L["Cancel auction"] = "Auktion abbrechen"
L["Cannot start auction without Master Looter privileges."] = "Man kann keine Auktionen starten ohne Plündermeister zu sein!"
L[" |cffaa0000(Distribute: %dg)|r"] = "|cffaa0000(Verteilen: %dg)|r"
L["Control panel scale"] = "Kontrollfeld-Skalierung"
L["Countdown timer announce interval"] = "Intervall für Zeitankündigungen"
L["Current bid: "] = "Momentanes Gebot: "
L["Distribute"] = "Verteilen"
L["Do not announce"] = "Nicht bekanntgeben"
L["Do you want to save your pot or reset without saving? You can also add a note to the pot."] = "Soll der Topf vor dem zurücksetzen gespeichert werden? Mit dem Eingabefeld kann man vor dem Speichern eine Notiz hinzufügen."
L[ [=[Due to the changes to the addon message system implemented in patch 4.2, GDKPd is no longer able to communicate using its old version checking standard.
Thus, this version of GDKPd will only be able to send and receive version checks from and to versions 1.2.0 and above of GDKPd.
While all other functionalities of GDKPd should still be compatible with previous versions, we |cffff0000strongly recommend updating GDKPd to version 1.2.0 or above|r.]=] ] = [=[Weil sich das Addon-Nachrichtensystem mit Patch 4.2 geändert hat, kann GDKPd das bisherige Versionsprüfsystem nicht mehr verwenden.
Aus diesem Grund wird diese Version von GDKPd nur Versionsüberprüfungen an GDKPd-Versionen 1.2.0 und höher senden bzw. diese von diesen empfangen können. Zwar sollten alle anderen Funktionalitäten von GDKPd weiterhin mit bisherigen Versionen kompatibel sein, aber |cffff0000es ist dennoch dringend empfohlen, GDKPd auf Version 1.2.0 oder höher zu aktualisieren|r.]=] -- Needs review
L["Enable"] = "Aktivieren"
L["Enter the amount you want to add to player %s:"] = "Wie viel Gold soll Spieler %s hinzugefügt werden?"
L["Enter the amount you want to add to the pot:"] = "Gib die Menge ein, die du dem Topf hinzufügen willst:"
L["Enter the amount you want to subtract from player %s:"] = "Wie viel Gold soll Spieler %s abgezogen werden?"
L["Enter the amount you want to subtract from the pot:"] = "Gib die Menge ein, die du dem Topf abziehen willst."
L["Enter the maximum amount of money you want to bid on %s:"] = "Gib die Menge Gold an, die du höchstens auf %s bieten willst:"
L["Export"] = "Exportieren"
L["Frame alpha"] = "Fenster-Opazität"
L["Frame scale"] = "Fensterskalierung"
L["GDKPd auction history"] = "GDKPd Auktionsliste"
L["GDKPd auction history for %s"] = "GDKPd Auktionsverlauf für %s"
L[ [=[GDKPd: Drag to move
/gdkpd and check "Lock" to hide]=] ] = [=[GDKPd: Frei beweglich
/gdkpd und "Sperren", um zu verstecken]=]
L["Loot dropped: "] = "Beute:"
L["GDKPd: No detailed data available"] = "GDKPd: Keine Details verfügbar"
L["This raid uses GDKPd to faciliate its GDKP bidding process. While you can bid on items without having GDKPd installed, installing it provides you with a GUI bidding panel, auto bidding functions, auction timers, chat filtering and more!"] = "Dieser Schlachtzug verwendet GDKPd für seine Item-Auktionen! Man kann zwar auf Items bieten ohne GDKPd zu installieren, aber das AddOn bietet ein Biet-GUI, automatisches Bieten, Auktionstimer, Chatfilter und vieles mehr!"
L["GDKPd version %s. Packaged %s."] = "GDKPd Version %s. Erstellt %s."
L["Your version of GDKPd is outdated and no longer compatible with the raid leader's in one or more functionalities. In order to ensure smooth performance, please update GDKPd."] = "Deine Version von GDKPd ist veraltet und nicht mehr mit der des Schlachtzugleiters kompatibel. Um glatte Abläufe zu garantieren, ist es empfohlen, GDKPd zu aktualisieren."
L["Your version of GDKPd is slightly outdated compared to the raid leader's. Full compability should be possible, however, you might want to take some time and update GDKPd."] = "Deine Version von GDKPd ist leicht veraltet, allerdings noch mit der des Schlachtzugleiters kompatibel. Du könntest allerdings dir etwas Zeit nehmen und GDKPd aktualisieren."
L["Hide"] = "Verstecken"
L["Hide 'Auction cancelled' announcements"] = "\"Auktion abgebrochen\"-Nachrichten verstecken"
L["Hide 'Auction cancelled' announcements from raid warning"] = "\"Auktion abgebrochen\"-Nachrichten aus der Schlachtzugswarnung verstecken"
L["Hide 'Auction finished' announcements"] = "Verstecke 'Auktion abgeschlossen'-Ankündigungen"
L["Hide 'Bidding starts' announcements"] = "Verstecke 'Auktion beginnt'-Ankündigungen"
L["Hide 'Bidding starts' announcements from raid warning"] = "Verstecke 'Auktion beginnt'-Ankündigungen aus der Schlachtzugswarnung"
L["Hide chat messages"] = "Ankündigungen verstecken"
L["Hide 'Current pot:' announcements"] = "\"Momentaner Topf:\" Ankündigungen verstecken"
L["Hide frames in combat"] = "Fenster im Kampf verstecken"
L["Hide history window"] = "Verlauffenster verstecken"
L["Hide 'New highest bidder' announcements"] = "Verstecke 'Neues Höchstgebot'-Ankündigungen"
L["Hide players' bid messages"] = "Gebote der Spieler verstecken"
L["Hide status and balance windows"] = "Status und Kontostand verstecken"
L["Hide 'Time remaining' announcements"] = "Verstecke 'Verbleibende Zeit'-Ankündigungen"
L["Hide version check window"] = "Versionsfenster verstecken"
L["Highest bidder: %s"] = "Höchstbietender: %s"
L["History"] = "Verlauf"
L["iLvL ranges"] = "iLvL Abstände"
L["Item level settings"] = "Item-Level Einstg."
L["Item settings"] = "Item-Einstlg."
L["Itm"] = "Itm"
L["Link raid member balance to pot"] = "Kontostand mit Topf verbinden"
L["Lock"] = "Sperren"
L["Mail"] = "Brief"
L["Mail money"] = "Geld schicken"
L["Manual adjustment"] = "Manuelle Anpassung"
L["Minimum bid: "] = "Minimalgebot:"
L["Minimum increment"] = "Mindesterhöhung"
L["Minimum quality"] = "Minimalqualität"
L["Min increment"] = "Min. Erhöhung"
L["Notification options"] = "Benachrichtigungseinstellungen"
L["Notify outdated versions"] = "Veraltete Versionen benachrichtigen"
L["Notify outdated versions that are compatible with your version"] = "Veraltete Versionen, die mit deiner Version kompatibel sind benachrichtigen"
L["Notify outdated versions that aren't compatible with your version"] = "Veraltete Versionen, die nicht mit deiner Version kompatibel sind benachrichtigen"
L["Notify raid members that do not have GDKPd installed"] = "Schlachtzugsmitglieder, die GDKPd nicht installiert haben, benachrichtigen"
L["Per-item settings"] = "Pro-Item-Einstellungen"
L["Player balance"] = "Spieler-Ausgleich"
L["Please enter the itemID of an item you want to drop here:"] = "Bitte Gegenstands-ID eingeben:"
L["Pot export"] = "Export"
L["Pot size: %d|cffffd100g|r"] = "Topf: %d|cffffd100g|r"
L["Prevent dragging and hide anchor"] = "Ziehen verhindern und Anker verstecken"
L["Request version data"] = "Versions-Info anfordern"
L["Require confirmation when mailing pot shares"] = "Um Bestätigung fragen, wenn Gold per Post geschickt werden soll"
L["Restart auction"] = "Auktion neu starten"
L["Revert highest bid"] = "Höchstes Gebot rückgängig machen"
L["Rules"] = "Regeln"
L["Second bidder share"] = "Anteil des Zweitbietenden"
L["Show"] = "Zeigen"
L["Show addon frames"] = "Addonfenster anzeigen"
L["Show auction duration spiral"] = "Auktionsdauer als Spirale anzeigen"
L["Show countdown text on auction duration spiral"] = "Zeittext auf Spirale anzeigen"
L["Starting bid"] = "Anfangsgebot"
L["Stop bid"] = "Nicht mehr bieten"
L["The amount of seconds between each announcement of the remaining time"] = "Die Anzahl der Sekunden zwischen Ankündigungen der verbleibenden Zeit"
L["The amount of seconds that have to pass after a bid before the auction is closed"] = "Die Anzahl an Sekunden, die nach einem Gebot vergehen müssen, bevor die Auktion geschlossen wird"
L["The amount of seconds that have to pass before the auction is closed without bids recieved"] = "Die Anzahl der Sekunden, die vergehen müssen, damit die Auktion ohne erhaltene Gebote geschlossen wird."
L["Third bidder share"] = "Anteil des Drittbietenden"
L["This player does not have GDKPd running or his version of GDKPd does not yet support version checks."] = "Dieser Spieler hat GDKPd nicht installiert oder seine GDKPd-Version unterstützt keine Versionsüberprüfung."
L["This player has the same version of GDKPd as you do. Full compability is ensured."] = "Dieser Spieler hat dieselbe Version von GDKPd wie du. Kompatiblität ist sichergestellt."
L["This player's version of GDKPd is more advanced than yours. Please consult your Curse Client for updates or manually check the curse.com page."] = "Dieser Spieler hat eine aktuellere Version von GDKPd also du. Bitte überprüfe deinen Curse Client auf Updates oder lade diese manuell auf curse.com herunter."
L["This player's version of GDKPd is outdated and one or more functionalities are not compatible:"] = "Dieser Spieler hat eine veraltete Version von GDKPd und eine oder mehrere Funktionalitäten sind nicht kompatibel:"
L["This player's version of GDKPd is outdated. However, their version should be fully compatible with yours."] = "Dieser Spieler hat eine veraltete Version von GDKPd, die jedoch mit deiner kompatibel sein sollte."
L["This version of GDKPd was never functional due to internal errors."] = "Diese Version von GDKPd war aufgrund interner Fehler nie funktionsfähig"
L["This version's player balance window will be unable to recognize distributions by you."] = "Das Ausgleichsfenster dieser Version wird keine Verteilungen erkennen können, die du durchführst."
L["This version will be unable to recognize auctions cancelled by you."] = "Diese Version wird keine von dir abgebrochenen Auktionen erkennen"
L["This version will be unable to recognize auctions started by you."] = "Diese Version wird nicht in der Lage sein, von dir gestartete Auktionen zu erkennen"
L["This version will be unable to recognize version check requests by you. Version check requests sent by this version of GDKPd will not be answered."] = "Diese Version ist mit Versionsüberprüfungen der aktuellen Version nicht kompatibel. Versionsüberprüfungen von dieser Version von GDKPd können nicht beantwortet werden." -- Needs review
L[ [=[This will completely wipe your auction history and is IRREVERSIBLE.
Are you completely SURE you want to do this?]=] ] = [=[Das Löschen des Auktionsverlaufes ist permanent und der Verlauf ist unwiederbringlich verloren.
Auktionsverlauf wirklich löschen?]=]
L["Toggle zero balance"] = "Ausgeglichene Werte an/aus"
L["Use looting system loot threshold setting"] = "Grenze des Lootsystems verwenden"
L["Use slim bidding window even while Master Looter"] = "Schlankes Bietfenster als Plündermeister verwenden"
L["Version notifications"] = "Versions-Benachrichtigungen"
L["Versions"] = "Versionen"
L["Version status for player %s"] = "Versionsdaten für Spieler %s"
L["Visibility settings"] = "Anzeigeeinstellungen"
L[ [=[WARNING!

If you use the slim bidding frame, you will be unable to cancel auctions and revert bids!
Are you certain you want to do this?]=] ] = [=[ACHTUNG!

Das schlanke Bietfenster kann weder Auktionen abbrechen noch Gebote zurücksetzen!
Wirklich ändern?]=]
L["Wipe history"] = "Verlauf löschen"
L[ [=[You have looted a monster!
Do you want GDKPd to announce loot?]=] ] = [=[Monster geplündert!
Soll GDKPd Beute bekanntgeben?]=]
L[ [=[You have selected the current pot, size %d gold.
What do you want to do with this pot?]=] ] = [=[Du hast den aktuellen Topf ausgewählt, die Grösse ist %d Gold.
Was möchtest du mit dem Topf machen?]=]
L[ [=[You have selected the following pot:
%s, dated %s, size %d gold.
What do you want to do with this pot?]=] ] = [=[Folgender Topf ist ausgewählt:
%s vom %s, enthielt %d gold.
Was soll mit diesem Topf geschehen?]=]
