#!/bin/bash
echo -n "Vad heter du?" # skriver ut på skärmen
    read Username       # ta värdet från användare och spara det i Usernamn
    echo -n "Hur gammal är du?"
    read Age            # # ta värdet från användare och spara det i Age
    echo -n "Var bor du?"
    read Ort
# skriver ut meningen med värdet till Username. Age och Ort
echo "Du är $Username, du är $Age år gammal och bor i $Ort!"

