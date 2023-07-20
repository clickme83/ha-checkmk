#!/bin/bash
echo "First run, creating site mon..."
omd create --no-tmpfs monitoring
omd config monitoring set APACHE_MODE own
omd config monitoring set APACHE_TCP_ADDR 0.0.0.0
omd config monitoring set APACHE_TCP_PORT 5000
omd config monitoring set CORE nagios
omd enable monitoring
