#!/bin/bash

insert_line() {
	file=`mktemp`
	sed -E "s/^(\\s*)${2}$/&\\n\\1${3}/" $1 > $file
	cat $file > $1
}

remove_line() {
	file=`mktemp`
	sed -E "/^.*${2}.*$/d" $1 > $file
	cat $file > $1
}

check_line() {
	if [ -z "$(grep $2 $1)" ]
	then
		return 0
	fi
	return 1
}

nginx_check_installed() {
	echo "Checking if Nginx is installed"
	if [ -d "/etc/nginx/conf.d/" ]
	then
		echo "Detected Nginx installation"
		return 0
	fi
	echo "Nginx not found"
	return 1
}

nginx_check_custom() {
	echo "Checking for custom Nginx configuration"
	if [ ! \( -z "$(grep -E "^[^#]*(fastcgi|hhvm.conf)" "/etc/nginx/nginx.conf")" \) \
	  -o ! \( -z "$(grep -ER "^[^#]*(fastcgi|hhvm.conf)" "/etc/nginx/conf.d/")" \) \
          -o ! \( -z "$(grep -ER "^[^#]*(fastcgi|hhvm.conf)" "/etc/nginx/sites-enabled/")" \) ]
	then
		echo "WARNING: Detected clashing configuration. Look at /etc/nginx/hhvm.conf for information how to connect to the hhvm fastcgi instance."
		return 0
	fi
	return 1
}

nginx_enable_module() {
	echo "Enabling hhvm Nginx module"
	insert_line "/etc/nginx/sites-enabled/default" 'server_name.*$' 'include hhvm.conf;'
	echo "Finished enabling module"
}

nginx_disable_module() {
	echo "Disabling hhvm Nginx module"
	remove_line "/etc/nginx/sites-enabled/default" "hhvm.conf"
	echo "Finished disabling module"
}

nginx_restart() {
	echo "Restarting Nginx"
	if [ ! -f "/etc/init.d/nginx" ]
	then
		echo "Nginx init.d script not found"
		return 0
	fi
	result=$(/etc/init.d/nginx status | grep 'is running')
	if [ ! -z "$result" ]
	then
		echo "Nginx is running, restarting"
		/etc/init.d/nginx stop
		/etc/init.d/nginx start
		echo "Restarted nginx"
	fi
	echo "Finished restarting Nginx"
}

#!/bin/bash

nginx_postinst() {
	if ! nginx_check_installed
	then
		return 0
	fi

	if nginx_check_custom
	then
		return 0
	fi

	nginx_enable_module
	nginx_restart
	return 0
}

nginx_postinst
