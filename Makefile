install:

	install sdn sdn_tui sdn_tui2 /usr/local/bin

	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin

	grep -q "`cat sdn.services`" /etc/services || cat sdn.services >> /etc/services

	install sdn.xinetd /etc/xinetd.d/sdn

	ln -sf /usr/local/bin/sdn_tui /usr/local/bin/sdn_net

	ln -sf /usr/local/bin/sdn_tui /usr/local/bin/sdn_gui

	cp banner.txt /usr/local/etc

	systemctl start xinetd

	systemctl reload xinetd



clone:

	git clone https://github.com/florianakos/sdnbcqkd



download:

	git pull



upload:

	git add -A

	git commit

	git push origin



tags:

	git push origin --tags
