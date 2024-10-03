#! bash oh-my-bash.module
############################---Description---###################################
#                                                                              #
# Summary       : Show a progress bar GUI on terminal platform                 #
# Support       : destro.nnt@gmail.com                                         #
# Created date  : Aug 12,2014                                                  #
# Latest Modified date : Aug 13,2014                                           #
#                                                                              #
################################################################################

############################---Usage---#########################################

# Copy below functions (delay and progress fuctions) into your shell script directly
# Then invoke progress function to show progress bar

# In other way, you could import source indirectly then using. Nothing different

################################################################################

# Global variable to store progress value
_omb_plugin_progress_value=0

#
# Description : delay executing script
#
function delay()
{
  sleep 0.2;
}

#
# Description : print out executing progress
#
function progress()
{
    local value=$1;
    local message=$2;

    if [ -z $value ]; then
      printf "Usage: progress <value> [message]\n\n"
      printf "Options:\n"
      printf "  value    The value for the progress bar. Use 0 to reset.\n"
      printf "  message  The optional message to display next to the progress bar.\n"
      return 0
    fi

    if [ $value -lt 0 ]; then
      _omb_log_error "invalid value: value' (expect: 0-100)" >&2
      return 2
    fi

    # Reset the progress value
    if [ $value -eq 0 ]; then
      _omb_plugin_progress_value=0;
      return 0
    fi

    # Clear the message whitespace
    local size=$((40-${#message}))
    local whitespace=""
    for ((i=0; i<size; i++)); do
      whitespace="$whitespace "
    done

    if [ $_omb_plugin_progress_value -le 0 -a $value -ge 0 ]  ; then echo -ne "[--------------------------] (0%)  $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 5 -a $value -ge 5 ]  ; then echo -ne "[#-------------------------] (5%)  $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 10 -a $value -ge 10 ]; then echo -ne "[##------------------------] (10%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 15 -a $value -ge 15 ]; then echo -ne "[###-----------------------] (15%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 20 -a $value -ge 20 ]; then echo -ne "[####----------------------] (20%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 25 -a $value -ge 25 ]; then echo -ne "[#####---------------------] (25%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 30 -a $value -ge 30 ]; then echo -ne "[######--------------------] (30%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 35 -a $value -ge 35 ]; then echo -ne "[#######-------------------] (35%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 40 -a $value -ge 40 ]; then echo -ne "[########------------------] (40%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 45 -a $value -ge 45 ]; then echo -ne "[#########-----------------] (45%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 50 -a $value -ge 50 ]; then echo -ne "[##########----------------] (50%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 55 -a $value -ge 55 ]; then echo -ne "[###########---------------] (55%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 60 -a $value -ge 60 ]; then echo -ne "[############--------------] (60%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 65 -a $value -ge 65 ]; then echo -ne "[#############-------------] (65%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 70 -a $value -ge 70 ]; then echo -ne "[###############-----------] (70%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 75 -a $value -ge 75 ]; then echo -ne "[#################---------] (75%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 80 -a $value -ge 80 ]; then echo -ne "[####################------] (80%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 85 -a $value -ge 85 ]; then echo -ne "[#######################---] (90%) $message$whitespace \r"  ; delay; fi;
    if [ $_omb_plugin_progress_value -le 90 -a $value -ge 90 ]; then echo -ne "[##########################] (100%) $message$whitespace \r" ; delay; fi;
    if [ $_omb_plugin_progress_value -le 100 -a $value -ge 100 ];then echo -ne 'Done!                                            \n' ; delay; fi;

    _omb_plugin_progress_value=$value;
}
