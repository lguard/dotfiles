#~/usr/bin/env bash

ZENITY_LIST=""
for i in $HOME/.screenlayout/*;do
    ZENITY_LIST="$ZENITY_LIST $i $(basename --suffix='.sh' $i)";
done

echo $ZENITY_LIST

RESULT=`zenity --list --title="Choisissez les bogues à afficher" --hide-column=1 --column="script" --column="ScreenLayout" $ZENITY_LIST --extra-button arandr`
if [ "$RESULT" != "" ];then
    if [ "$RESULT" = "arandr" ];then
        arandr
    else
        $RESULT
    fi
fi
