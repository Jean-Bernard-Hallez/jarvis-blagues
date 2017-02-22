#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file


jv_pg_ct_blague() {
debutlignealireblague=236
finlignealireblague=261

varchemblague="$jv_dir/plugins/jarvis-blagues/toto.txt"

wget -q - http://humour-blague.com/blagues-2/index.php# -O $varchemblague
iconv -f cp1252 -t utf8 "$varchemblague" | sponge "$varchemblague"


while test $debutlignealireblague != $finlignealireblague
do
lignesay=$(sed -n "$debutlignealireblague p" $varchemblague)
grep -q '<p' <<< "$lignesay" && exitblaguesay && return || jv_pg_ct_blaguesay
done

}




jv_pg_ct_blaguesay() {
# maintenant je lis la ligne A 
transcritblague            
blaguesaytestdebut # test la ponctuation Minuscule, majuscule, point ? ou .
memolignedetestA=$debutlignealireblague
direblaguesayokA="$direblaguesayok"
blaguesaymajusculeA="$blaguesaymajuscule"
if [[ "$blaguesaymajusculeint" =~ "int" ]] || [[ "$blaguesaymajusculeint" =~ "poi" ]]; then # Je vais voir si la fin de la phrase est  ? ou un . ou rien
pointinterrogationoupoint
return
fi



	# ### maintenant je vais vérifier si je dois coller la ligne B à A 
	debutlignealireblague=$(($debutlignealireblague + 1))
	transcritblague  # +1 de la ligne            
	blaguesaytestdebut
	memolignedetestB=$debutlignealireblague
	direblaguesayokB="$direblaguesayok"
	blaguesaymajusculeB="$blaguesaymajuscule"
	if [[ "$blaguesaymajusculeint" =~ "int" ]] || [[ "$blaguesaymajusculeint" =~ "poin" ]]; then # Je vais voir si la fin de la phrase est  ? ou un . ou rien
	direblaguesayok="$direblaguesayokA $direblaguesayok"
	pointinterrogationoupoint
	return
	fi

	if [[ "$blaguesaymajusculeB" =~ "min" ]]; then

		# ### maintenant je vais vérifier si je dois coller la ligne d'après C à B
		debutlignealireblague=$(($debutlignealireblague + 1))
		transcritblague  # +1 de la ligne              
		blaguesaytestdebut
		memolignedetestC=$debutlignealireblague
		direblaguesayokC="$direblaguesayok"
		blaguesaymajusculeC="$blaguesaymajuscule"
		if [[ "$blaguesaymajusculeint" =~ "int" ]] || [[ "$blaguesaymajusculeint" =~ "poin" ]]; then # Je vais voir si la fin de la phrase est  ? ou un . ou rien
		direblaguesayok="$direblaguesayokA $direblaguesayokB $direblaguesayok"
		pointinterrogationoupoint
		return
		fi
		if [[ "$blaguesaymajusculeC" =~ "min" ]]; then
		
				# ### maintenant je vais vérifier si je dois coller la ligne d'après D à C
				debutlignealireblague=$(($debutlignealireblague + 1))
				transcritblague  # +1 de la ligne              
				blaguesaytestdebut
				memolignedetestD=$debutlignealireblague
				direblaguesayokD="$direblaguesayok"
				blaguesaymajusculeD="$blaguesaymajuscule"
				if [[ "$blaguesaymajusculeint" =~ "int" ]] || [[ "$blaguesaymajusculeint" =~ "poin" ]]; then # Je vais voir si la fin de la phrase est  ? ou un . ou rien
				direblaguesayok="$direblaguesayokA $direblaguesayokB $direblaguesayokC $direblaguesayok"
				pointinterrogationoupoint
				return
				fi
				if [[ "$blaguesaymajusculeD" =~ "min" ]]; then
		
					# ### maintenant je vais vérifier si je dois coller la ligne d'après E à D
					debutlignealireblague=$(($debutlignealireblague + 1))
					transcritblague  # +1 de la ligne              
					blaguesaytestdebut
					memolignedetestE=$debutlignealireblague
					direblaguesayokE="$direblaguesayok"
					blaguesaymajusculeE="$blaguesaymajuscule"
					if [[ "$blaguesaymajusculeint" =~ "int" ]] || [[ "$blaguesaymajusculeint" =~ "poin" ]]; then # Je vais voir si la fin de la phrase est  ? ou un . ou rien
					direblaguesayok="$direblaguesayokA $direblaguesayokB $direblaguesayokC $direblaguesayokD $direblaguesayok"
					pointinterrogationoupoint
					return
					fi

						
						
						if [[ "$blaguesaymajusculeE" =~ "min" ]]; then
						# Tout est oui !! je colle tout A + B + C + D + E à coller
						debutlignealireblague=$memolignedetestE
						debutlignealireblague=$(($debutlignealireblague + 1))				
						avoirsicapasse="$direblaguesayokA $direblaguesayokB $direblaguesayokC $direblaguesayokD $direblaguesayokE"
						coupelalignendeux
						return						
							
						else
					
						# A + B + C + D  à coller
						debutlignealireblague=$memolignedetestD
						debutlignealireblague=$(($debutlignealireblague + 1))				
						avoirsicapasse="$direblaguesayokA $direblaguesayokB $direblaguesayokC $direblaguesayokD"
						direblaguesayokE=""
						coupelalignendeux
						return						
						fi

					else
					# A + B + C à coller
					debutlignealireblague=$memolignedetestC
					debutlignealireblague=$(($debutlignealireblague + 1))
					avoirsicapasse="$direblaguesayokA $direblaguesayokB $direblaguesayokC"
					direblaguesayokD=""; direblaguesayokE=""
					coupelalignendeux
					return
					fi
				
		else
		# A + B à coller
		debutlignealireblague=$memolignedetestB
		debutlignealireblague=$(($debutlignealireblague + 1))
		avoirsicapasse="$direblaguesayokA $direblaguesayokB"
		direblaguesayokC=""; direblaguesayokD=""; direblaguesayokE=""
		coupelalignendeux
		return
		fi
	
	
	else
	# A seul
	debutlignealireblague=$memolignedetestA
	debutlignealireblague=$(($debutlignealireblague + 1))
	avoirsicapasse="$direblaguesayokA"
	direblaguesayokB=""; direblaguesayokC=""; direblaguesayokD=""; direblaguesayokE=""
	coupelalignendeux
	return
	fi

return
# FIN............
}

transcritblague() {
blaguesaymajuscule=""
lignesay=$(sed -n "$debutlignealireblague p" $varchemblague)
direblaguesayok=`echo $lignesay | sed -e "s/<.*/ /g" | sed -e "s/&quot;/ /g" | sed -e "s/qu' un/qu'un/g" | sed -e "s/&acirc;/â/g" |  sed -e "s/&ugrave;/ù/g" |sed -e "s/&ucirc;/û/g" | sed -e "s/&eacute;/é/g" | sed -e "s/&Eacute;/é/g" | sed -e "s/&egrave;/è/g" | sed -e "s/&icirc;/î/g" | sed -e "s/&agrave;/à/g" | sed -e "s/&ecirc;/ê/g" | sed -e "s/&#8217;/'/g" | sed -e "s/&ccedil;/ç/g" | sed -e "s/&Ccedil;/ç/g" | sed -e "s/&rsquo;/'/g" | sed -e "s/&ocirc;/ô/g" | sed -e "s/&amp;/et/g" | sed -e "s/ &laquo;/ /g" | sed -e "s/ &raquo;/ /g" | sed -e "s/-\./-/g"`
#  &acirc;
}

exitblaguesay() {
# ### say "Fin... "
rm $varchemblague > /dev/null 2>&1
}


blaguesaytestdebut() {
# echo " $testpremierelet -------  minuscule ou caractère différent ------
testpremierelet=`echo ${direblaguesayok:0:1}`
re='[a-zA-Z]'

if [ "$testpremierelet" != "${testpremierelet,,}" ]; then 
# echo " $testpremierelet -------  majuscule ------"
blaguesaymajuscule="maj"
fi

if [[ "$testpremierelet" =~ $re ]]; then
# echo "$testpremierelet ---- caractère alphabet -----"		
blaguesaymajuscule="min"
else
# echo " $testpremierelet -------  caractère différent ------"
blaguesaymajuscule="dif"
fi

# --- Si il y  un ?
finponctuation=`echo ${direblaguesayok:(-3)}`
if [[ "$finponctuation" = "?" ]]; then 
# echo " -------  C'est une Question ------"
blaguesaymajusculeint="int"
return
fi

# --- Si il y  un .
finponctuation=`echo ${direblaguesayok:(-3)}`
if [[ "$finponctuation" = "." ]]; then 
# echo " -------  C'est un Point ------"
blaguesaymajusculeint="poi"
return
fi

blaguesaymajusculeint=""

}

coupelalignendeux() {

string_length=`echo $avoirsicapasse | wc -c`
if [[ "$string_length" == "2" ]]; then 
return
fi
if [[ "$string_length" -gt "199" ]]; then # echo "je coupe la phrase sur une ponctuation"
lignesay2=`echo $avoirsicapasse | cut -d'.' -f1`
lignesay3=`echo $avoirsicapasse | cut -d'.' -f2-`
# lignesay4=`echo $avoirsicapasse | cut -d'.' -f3-`
direblaguesayok1="$lignesay2"
pointinterrogation
direblaguesayok1="$lignesay3"
pointinterrogation
# direblaguesayok1="$lignesay4"
# pointinterrogation
lignesay2=""
lignesay3=""
# lignesay4=""
else
direblaguesayok1="$avoirsicapasse"
pointinterrogation
fi

}


pointinterrogation() {
estquestionblagues=`echo $direblaguesayok1 | cut -d' ' -f1`
if [[ "$estquestionblagues" =~ "Quelle" ]] || [[ "$estquestionblagues" =~ "quel" ]] || [[ "$estquestionblagues" =~ "pourquoi" ]] || [[ "$estquestionblagues" =~ "que" ]] || [[ "$estquestionblagues" =~ "qu'est" ]]; then 

	# --- Si il y  un ? à la fin
	finponctuation=`echo ${direblaguesayok:(-3)}`
	if [[ "$finponctuation" = "?" ]]; then 
	say " $direblaguesayok1 "; 
	pointinterrogationGONG
	return
	fi

	# --- Si il y  un ? au milieu de la pharse
	if [[ "$direblaguesayok1" =~ "?" ]]; then
	reponseprov=`echo $direblaguesayok1  | cut -d'?' -f1`
	say "$reponseprov ?"
	pointinterrogationGONG	
	reponseprov=`echo $direblaguesayok1  | cut -d'?' -f2`
	say "$reponseprov ?"
	return
	fi	

	if [[ "$direblaguesayok1" =~ "." ]]; then
	# --- Si il y  un . au milieu de la pharse
	reponseprov=`echo $direblaguesayok1  | cut -d'.' -f1`
	say "$reponseprov ."
	pointinterrogationGONG	
	reponseprov=`echo $direblaguesayok1  | cut -d'.' -f2`
	say "$reponseprov ."
	return
	fi

	if [[ "$direblaguesayok1" =~ ":" ]]; then
	deuxpoint=`echo $direblaguesayok1 | grep -io ':' | wc -l`
		if [[ "$deuxpoint" > "1" ]]; then

		# --- Si il y  un : au milieu de la pharse
		reponseprov=`echo $direblaguesayok1  | cut -d':' -f1-2`
		say "$reponseprov :"
		pointinterrogationGONG	
		reponseprov=`echo $direblaguesayok1  | cut -d':' -f3`
		say "$reponseprov"
		return
		else
		reponseprov=`echo $direblaguesayok1  | cut -d':' -f1`
		say "$reponseprov :"
		pointinterrogationGONG	
		reponseprov=`echo $direblaguesayok1  | cut -d':' -f2`
		say "$reponseprov"
		return

		fi
	fi

fi

monsieuretmadame=`echo $direblaguesayok1 | grep -io '\(monsieur\|madame\|fils\|fille\)' | wc -l`
if [[ "$monsieuretmadame" == "3" ]]; then # --- Si il y  un ? au milieu de la pharse
	if [[ "$direblaguesayok1" =~ "?" ]]; then
	reponseprov=`echo $direblaguesayok1  | cut -d'?' -f1`
	say "$reponseprov ?"
	pointinterrogationGONG	
	reponseprov=`echo $direblaguesayok1  | cut -d'?' -f2`
	say "$reponseprov ?"
	fi

	if [[ "$direblaguesayok1" =~ ":" ]]; then
	reponseprov=`echo $direblaguesayok1  | cut -d':' -f1`
	say "$reponseprov :"
	pointinterrogationGONG	
	reponseprov=`echo $direblaguesayok1  | cut -d':' -f2`
	say "$reponseprov :"
	fi
 else
 say "$direblaguesayok1"
fi

}


pointinterrogationGONG() {
# say "api $jv_api et keyboard $keyboard"

if [[ "$jv_api" == "true" ]] || [[ "$keyboard" == "true" ]] ; then
say "..."
return
else
# echo "--- Pause 4 sec ---  "
mpg321 "$jv_dir/plugins/jarvis-blagues/sonnette.mp3" > /dev/null 2>&1
sleep 4
mpg321 "$jv_dir/plugins/jarvis-blagues/sonnette.mp3" > /dev/null 2>&1
# echo "--- Pause 4 sec ---  "
fi
}

pointinterrogationoupoint() {
if [[ "$blaguesaymajusculeint" =~ "int" ]]; then # Je vais voir si la fin de la phrase est  ? ou un . ou rien
direblaguesayok1="$direblaguesayok"
pointinterrogation 
debutlignealireblague=$(($debutlignealireblague + 1))
return
fi

if [[ "$blaguesaymajusculeint" =~ "poi" ]]; then # Je vais voir si la fin de la phrase est un . 
say "$direblaguesayok"
debutlignealireblague=$(($debutlignealireblague + 1))
fi
}