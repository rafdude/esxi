#!/bin/sh
## remove license

echo '==============================================================================================='
echo '                             #####  #######    #    ######  #######'
echo '  #   #   #   #   #   #     #     #    #      # #   #     #    #        #   #   #   #   #   #  '
echo '   # #     # #     # #      #          #     #   #  #     #    #         # #     # #     # #   '
echo ' ####### ####### #######     #####     #    #     # ######     #       ####### ####### ####### '
echo '   # #     # #     # #            #    #    ####### #   #      #         # #     # #     # #   '
echo '  #   #   #   #   #   #     #     #    #    #     # #    #     #        #   #   #   #   #   #  '
echo '                             #####     #    #     # #     #    #                               '
echo '==============================================================================================='
now=$(date +'%m/%d/%Y @ %r')
echo   "Script Starting run @ {$now}"


echo 'Removing License'
ssh root@esxi  'rm -r /etc/vmware/license.cfg'
ssh root@esxi  'rm -r /etc/vmware/vmware.lic'
## get a new trial license
echo 'Copying new license'
ssh root@esxi  'cp /etc/vmware/.#license.cfg /etc/vmware/license.cfg'
ssh root@esxi  'cp /etc/vmware/.#vmware.lic /etc/vmware/vmware.lic'
## restart services
echo 'Restarting VPXA'
ssh root@esxi  '/etc/init.d/vpxa restart'


now=$(date +'%m/%d/%Y @ %r')
echo   "Script Ending run @ {$now}"


echo '==============================================================================================='
echo '                                    ####### #     # ######'
echo '  #   #   #   #   #   #   #   #     #       ##    # #     #     #   #   #   #   #   #   #   #  '
echo '   # #     # #     # #     # #      #       # #   # #     #      # #     # #     # #     # #   '
echo ' ####### ####### ####### #######    #####   #  #  # #     #    ####### ####### ####### ####### '
echo '   # #     # #     # #     # #      #       #   # # #     #      # #     # #     # #     # #   '
echo '  #   #   #   #   #   #   #   #     #       #    ## #     #     #   #   #   #   #   #   #   #  '
echo '                                    ####### #     # ######'
echo '==============================================================================================='
