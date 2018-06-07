install: sdn_ui-es.mo
	install sdn sdn_ui sdn_gui /usr/local/bin

	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin

	grep -q "`cat sdn.services`" /etc/services || cat sdn.services >> /etc/services

	install sdn.xinetd /etc/xinetd.d/sdn

	ln -sf /usr/local/bin/sdn_ui /usr/local/bin/sdn_net
	ln -sf /usr/local/bin/sdn_ui /usr/local/bin/sdn_gui

	install sdn_ui-es.mo /usr/share/locale/es/LC_MESSAGES/sdn_ui.mo


	systemctl start xinetd

	systemctl reload xinetd


sdn_ui.pot: sdn_ui
	xgettext -o sdn_ui.pot -L Shell sdn_ui

sdn_ui-es.mo: sdn_ui-es.po
	msgfmt -o sdn_ui-es.mo sdn_ui-es.po


clone:

	git clone https://github.com/josemperdomoz/FOSS-SDN-JMPZ.git



download:

	git pull



upload:

	git add -A

	git commit

	git push origin



tags:

	git push origin --tags
