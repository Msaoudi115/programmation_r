brutToNet1 = function(salaire_brut) {
if(is.numeric(salaire_brut) == "TRUE")
  {calcul <- salaire_brut * 0.78 
  return (calcul)}
else
  {stop('ERROR : type not expected')}
 }

brutToNet1(as.integer(readline(prompt="Entrez un salaire")))

brutToNet2 = function(salaire_brut,contrat) {

  
  if(contrat == 'cadre') {
    cotis = 0.25}
  if(contrat == 'non-cadres') {
    cotis = 0.22}
  calcul <- salaire_brut * (1-cotis)*(1-tauxprelevement/100)
  return (calcul)
  
if((contrat != 'cadre') | (contrat != 'non-cadres')) {
  stop('ERROR : contract unknown')}
}


brutToNet2(as.integer(readline(prompt="Entrez un salaire")),readline(prompt="Entrez un type de contrat"))


brutToNet3 = function(salaire_brut,contrat,tauxprelevement=7.5,tempstravail=100) {
  
  {if(tauxprelevement<0|tauxprelevement>100|tempstravail<0|tempstravail>100)
    stop('ERROR:rate and time must be in range(0,100)')}
  if(contrat == 'cadre') {
    cotis = 0.25}
  if(contrat == 'non-cadres') {
    cotis = 0.22}
  salaire_net <- salaire_brut * (1-cotis)*(1-tauxprelevement/100)*(tempstravail/100)
  print(paste(" le salaire net avant impots est de",salaire_brut))
  print(paste(" le salaire net apres impots est de",salaire_net))
  return (salaire_net)
  
  
  
  if((contrat != 'cadre') | (contrat != 'non-cadres')) {
    stop('ERROR : contract unknown')}
}


brutToNet3(as.integer(readline(prompt="Entrez un salaire")),readline(prompt="Entrez un type de contrat"),as.integer(readline(prompt="Entrez un taux de prelevement (facultatif)")),as.integer(readline(prompt="Entrez un temps de travail (facultatif)")))
