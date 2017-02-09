#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file

jv_pg_ct_blague() {
varchemblague="$jv_dir/plugins/jarvis-blagues/toto.txt"

wget -q - http://humour-blague.com/blagues-2/index.php# -O $varchemblague

debutlignealireblague=236
finlignealireblague=261

while test $debutlignealireblague != $finlignealireblague
do
lignesay=$(sed -n "$debutlignealireblague p" $varchemblague)
grep -q '<p' <<< "$lignesay" && exitblaguesay && return || jv_pg_ct_blaguesay
done
}

jv_pg_ct_blaguesay() {
# echo "---- $lignesay ----"
transcritblague
direblaguesay=$direblaguesayok

# --- Si il y  un ?
if [[ "$lignesay" =~ "?" ]]; then 
estquestionblagues=`echo $lignesay | cut -d' ' -f1`

	# if [[ "$lignesay" == "quel" ]] || [[ "$lignesay" =~ "pourquoi" ]] || [[ "$lignesay" =~ "que" ]] || [[ "$lignesay" =~ "qu'est" ]]; then 
	if [[ "$estquestionblagues" =~ "quel" ]] || [[ "$estquestionblagues" =~ "pourquoi" ]] || [[ "$estquestionblagues" =~ "que" ]] || [[ "$estquestionblagues" =~ "qu'est" ]]; then 
	say "$direblaguesay"
		if $jv_json || $just_execute; then
		echo " "
		else
		mpg321 "$jv_dir/plugins/jarvis-blagues/sonnette.mp3" > /dev/null 2>&1
		sleep 4
		mpg321 "$jv_dir/plugins/jarvis-blagues/sonnette.mp3" > /dev/null 2>&1
		say "   "
		fi
	 debutlignealireblague=$(($debutlignealireblague + 1))
	 return
	else
	say "$direblaguesay"
        debutlignealireblague=$(($debutlignealireblague + 1))

	 fi
else

# --- Je test voir si la phrase d'après est une majuscule si pas je lis ma ligne

debutlignealireblague=$(($debutlignealireblague + 1))
lignesay=$(sed -n "$debutlignealireblague p" $varchemblague)

transcritblague
direblaguesayplus=$direblaguesayok

testpremierelet=`echo $direblaguesayplus | cut -c1`
	if [ "$testpremierelet" != "${testpremierelet,,}" ]; then 
	# echo " $testpremierelet -------  majuscule ------"
        say "$direblaguesay"
	else
	# echo " $testpremierelet -------  minuscule ou caractère différent ------"
	re='[a-zA-Z]'
		if [[ "$testpremierelet" =~ $re ]]; then
		# echo "$testpremierelet ---- caractère alphabet -----"
		lignesay=`echo $direblaguesay $direblaguesayplus`
		transcritblague
		say "$direblaguesayok" 
		debutlignealireblague=$(($debutlignealireblague + 1))
		return
		else 
		# echo "$testpremierelet ----Pas caractère alphabet -----"
		say "$direblaguesay"
		return
		fi

	 fi
# debutlignealireblague=$(($debutlignealireblague + 1))
fi
}

transcritblague() {
direblaguesayok=`echo $lignesay | sed -e "s/<.*/ /g" | sed -e "s/&quot;/ /g" | sed -e "s/&ucirc;/û/g" | sed -e "s/&eacute;/é/g" | sed -e "s/&Eacute;/é/g" | sed -e "s/&egrave;/è/g" |  sed -e "s/&icirc;/î/g"  | sed -e "s/&agrave;/à/g" | sed -e "s/arr&ecirc;/ê/g" | sed -e "s/&ecirc;/ê/g" | sed -e "s/&#8217;/'/g" | sed -e "s/&ccedil;/ç/g" | sed -e "s/&Ccedil;/ç/g" | sed -e "s/&rsquo;/'/g" | sed -e "s/h&ocirc;/ô/g" | sed -e "s/&amp;/et/g"`
}

exitblaguesay () {
echo " "
rm $varchemblague > /dev/null 2>&1
}


