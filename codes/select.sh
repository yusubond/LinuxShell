#!/bin/bash
# set PS3 prompt
PS3="Enter the space shuttle to get more information "
select shuttle in columbla endeavour challenger discovery atlantis enterprise pathfinder exit
do
  case $shuttle in
    columbla)
      echo "--------------"
      echo "Space Shuttle Columbla was the first spaceworthy space shuttle in NASA's orbital fleet."
      echo "--------------"
      ;;
    endeavour)
  		echo "--------------"
  		echo "Space Shuttle Endeavour is one of three currently operational orbiters in the Space Shuttle."
  		echo "--------------"
  		;;
  	challenger)
  		echo "--------------"
  	    echo "Space Shuttle Challenger was NASA's second Space Shuttle orbiter to be ut into service."
  		echo "--------------"
  		;;
  	discovery)
  		echo "--------------"
  		echo "Discovery became the third operational orbiter, and is now the oldest one in service."
  		echo "--------------"
  		;;
  	atlantis)
  		echo "--------------"
  		echo "Atlantis was the fourth operational shuttle built."
  		echo "--------------"
  		;;
  	enterprise)
  		echo "--------------"
  		echo "Space Shuttle Enterprise was the first Space Shuttle orbiter."
  		echo "--------------"
  		;;
  	pathfinder)
  		echo "--------------"
  		echo "Space Shuttle Orbiter Pathfinder is a Space Shuttle simulator made of steel and wood."
  		echo "--------------"
  		;;
    exit)
      echo "Bye!"
      break
      ;;
  	*)
  		echo "Error: Please try again (select 1..7)!"
  		;;
  	esac
done
