POOTLE_BIN=/usr/local/bin/pootle
POOTLE_CONF=/root/.pootle/pootle.conf
POOTLE_SCRIPT_HOME=/home/pootle/scripts

POOTLE_BACKUP_ROOT=/home/pootle/backup
POOTLE_BACKUP_DAYS=28

#POOTLE_PID=$POOTLE_SCRIPT_HOME/tmp/fcgi-t3-pootle.pid
#POOTLE_FCGI_SOCK=/tmp/fcgi-t3-pootle.sock
POOTLE_LOG=/var/log/pootle/pootle.log
POOTLE_ERR=/var/log/pootle/pootle.err
POOTLE_PO=/srv/pootle/po

STATE_DIR=${POOTLE_SCRIPT_HOME}/.build-language-pack-state

CONF_LANG_COMPAT=${POOTLE_SCRIPT_HOME}/etc/lang-compat.conf

LOCAL_GIT_CLONE_DIRECTORY=/srv/pootle/git-clones

XSL_LLXML2XLIFF_SOURCE=${POOTLE_SCRIPT_HOME}/etc/xsl/xliff2llxml-source.xsl
XSL_LLXML2XLIFF_TARGET=${POOTLE_SCRIPT_HOME}/etc/xsl/xliff2llxml-target.xsl
XSL_LLXML2TEMPLATE=${POOTLE_SCRIPT_HOME}/etc/xsl/llxml2template.xsl

_LAST_BUILD_FILE="${POOTLE_SCRIPT_HOME}/.build-language-pack-lastbuild"

TER_L10N_PATH=/l10n_ter

TYPO3_GIT=git://git.typo3.org/Packages/TYPO3.CMS.git
