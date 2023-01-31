brutToNet1 = function(salaire_brut) {
if(is.numeric(salaire_brut) == "TRUE")
{calcul <- salaire_brut * 0.78 
return (calcul)}
else {stop('ERROR : type not expected')}
 }

brutToNet1(2000)

brutToNet2 = function(salaire_brut,contrat) {

if((contrat != 'non-cadres') | (contrat != 'non-cadres')) {
stop('ERROR : contract unknown')}
  
  
if(contrat == 'cadre') {
cotis = 0.25
calcul <- salaire_brut * (1-cotis)*0.925
return (calcul)}

if(contrat == 'non-cadres') {
cotis = 0.22
calcul <- salaire_brut * (1-cotis)*0.925
return (calcul)}
}


brutToNet2(2500,'non-cadres')

