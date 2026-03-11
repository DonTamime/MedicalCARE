10.5 L'essai clinique MedicalCare
(Ce sujet a été créé par Allan Fousse, à partir d'exemples de protocoles réels)
Public de référence GPhy-Physio, GPhy-DM, ECMPS
L'objectif est de mettre en ÷uvre un ensemble logiciel pour le pilotage, le recueil de données cliniques
et le dossier bio-statistique pour l'essai clinique MedicalCare. Cet essai clinique constitue une mise en
1. Voir https://rmarkdown.rstudio.com.
10.5. L'ESSAI CLINIQUE MEDICALCARE 181
situation destinée à vous faire découvrir un certain nombre de concepts et leur mise en ÷uvre. Il ne
satisfait pas les réglements en vigueur sur les essais cliniques.
L'objectif de cet essai clinique est de tester (soit séparément, soit en action combinée) les eets de
deux nouvelles molécules nommées Tricazen et Vicazen. Le protocole prévoit d'administrer pendant
trente jours deux comprimés par jour à chaque patient de l'échantillon de volontaires qui auront été
sélectionnés. L'essai est multi-centrique, et se déroule en double aveugle.
Les patients sont hospitalisés dans les centres médicaux qui participent à l'essai clinique. Chaque
centre met un certain nombre de ses médecins à disposition de l'étude. Il dispose obligatoirement de
services en mesure de réaliser tous les jours les examens ou analyses suivants :
 électro-encéphalogramme ;
 prise de sang et synthèse des résultats d'analyse ;
 test d'eort ;
 test PCR covid.
Les médecins d'un centre sont supervisés par l'attaché de recherche clinique de l'étude présent dans
ce centre. Les attachés de recherche clinique travaillent sous la responsabilité du data manager responsable de l'étude.
Le commanditaire cone aux centres organisateurs de l'essai clinique le recrutement et la sélection des
patients. Lors de cette étape, chaque centre recense les informations nécessaires d'une part à l'étude
bio-statistique qui sera réalisée une fois la phase clinique de l'essai terminée, d'autre part à une levée
d'anonymat éventuelle en cours d'étude pour l'un ou l'autre patient, si nécessaire. Le protocole prévoit
que le médecin qui a assuré la visite pré-recrutement pour un patient donné soit identié. Une fois tous
les patients recrutés, les données les concernant sont centralisées, et la randomisation est eectuée en
une fois pour la totalité des patients de l'étude. Les professionnels qui assurent le bon déroulement
de l'essai (ARC, médecins, etc.) n'ont pas accès aux informations d'identication des patients, ni à
leur groupe d'aectation, une fois la randomisation eectuée. Sur le plan médical, les centres d'étude
constituent un dossier médical du patient : de quelles pathologies soure-t-il ou a-t-il souert (si il y en
a), quels traitements prend-il de manière permanente (e.g. en cas de diabète, d'hypercholestérolémie).
On recence aussi les actes médicaux réguliers (e.g. les dialises) ou ponctuels (e.g. les opérations
chirurgicales). Les médecins et auxiliaires médicaux (inrmiers et kinésithérapeuthes) sont identiés
par leur numéro ADELI et leur spécialité (généraliste est vu comme une spécialité). Pour des raisons
de praticité, on mémorise aussi leur identité et le centre d'essai clinique dans lequel ils travaillent
(même chose pour les attachés de recherche clinique). Chaque médecin est par ailleurs référent d'une
cohorte de patients de l'essai clinique, dont il assure le suivi. Tous ces patients sont hospitalisés dans
le centre d'essai dans lequel leur médecin référent travaille.
Avant le début de l'étude les pharmaciens du commanditaire préparent des lots de deux comprimés
indiérentiables de Tricazen, Vicazen ou Placebo. Ces lots peuvent contenir :
 un Tricazen et un Vicazen ;
 un Tricazen et un Placebo ;
 un Vicazen et un Placebo ;
 deux Placebo (groupe témoin).
Chaque lot est identié par un numéro suivant le format nnnnjj, où nnnn est le numéro du patient
qui devra le prendre et jj l'indice du jour de prise. Par exemple, le lot 213125 doit être pris par le
patient numéro 2131 lors du 25e`
jour de l'étude.
Les patients sont regroupés en fonction de la composition des lots qu'ils prennent durant l'étude. Il
y a ainsi le groupe TV, dans lequel les patients prennent chaque jour un comprimé de Tricazen et
un comprimé de Vicazen. De la même façon, on a un groupe TP (Tricazen/Placebo), un groupe VP
182 CHAPITRE 10. SUJET DE PROJET PÉDAGOGIQUE DE MASTER 1
(Vicazen/Placebo) et un groupe PP (Placebo/Placebo). Les groupes de patients qui ne prennent pas
que des placebos (donc tous sauf PP) sont divisés en trois sous-groupes numérotés de 1 à 3 :
 ceux du sous-groupe 1 prennent les molécules associées au groupe tous les jours,
 ceux du sous-groupe 2 ne la prennent que un jour sur deux, et le second jour ils prennent deux
comprimés de placebo,
 ceux du sous-groupe 3 ne la prennent que un jour sur trois, et le deux autres jours ils prennent
deux comprimés de placebo,
Tous les patients des sous-groupe 2 et 3 prennent les molécules associées à leur groupe le premier
jour de l'étude (donc ils ne commencent pas par un placebo).
Les groupes doivent être de tailles équivalentes 2
, et au sein d'un groupe donné les deux sous-groupes
sont aussi de tailles équivalentes. Les dossiers des patients volontaires sont analysés avant le démarrage
de l'étude clinique. Parmi les candidats, ne peuvent pas être retenus ceux qui achent au premier
jour de l'étude l'une des propriétés suivantes :
 moins de 18 ans ou plus de 65 ans,
 obésité ou extrême maigreur,
 au moins une pathologie ou opération excluante dans le dossier médical (la liste de ces pathologies et opérations est établie avant le début de l'essai clinique par les médecins de la société
commanditaire) dans les trois dernières années.
 au moins trois pathologies à risque dans le dossier médical (la liste de ces pathologies et opérations est établie avant le début de l'essai clinique par les médecins de la société commanditaire)
dans les deux dernières années.
L'apparition de l'un de ces symptômes en cours d'étude est un motif d'exclusion du patient.
Au delà de 45 ans, un patient de l'étude ne peut être inclus que dans les sous-groupes 2 et 3, ou bien
dans le groupe témoin.
Certaines pathologies non excluantes mais qui peuvent s'avérer à risque exigent un suivi permanent :
les délais séparant deux examens complémentaires consécutifs sont raccourcis pour les patients qui
en sourent (voir les remarques annexes, données à la n du texte). Comme pour les pathologies
excluantes, la liste des pathologies à risque est établie avant le début de l'essai clinique par les
médecins de la société commanditaire. Aucune intervention chirurgicale n'est à risque.
Dans tous les centres de l'étude, le fonctionnement quotidien est le suivant.
 L'inrmier de jour passe à la pharmacie de l'hôpital prendre l'ensemble des lots de médicaments
à remettre aux patients de l'étude présents dans le centre. Il retrouve ensuite le médecin de
jour au bureau de l'essai clinique.
 Le médecin de jour (il change chaque jour, évidemment) passe le matin au bureau de l'essai
clinique. L'ARC imprime la liste des visites du jour, et la lui remet. Cette liste recense tous
les patients présents dans le centre (numéro du patient, numéro de la chambre). Pour chacun
d'eux elle contient les analyses complémentaires qui doivent être faites dans la journée, charge
au médecin de prescrire ces analyses.
 Le médecin et l'inrmier de jour passent ensuite voir tous les patients. Pour chacun d'eux, le
médecin s'assure qu'il prend son lot de comprimés (remis par l'inrmière). L'inrmier note
sur la che quotidienne de visite les informations suivantes : le numéro de la chambre, le
numéro du patient, le numéro du lot qui a été pris, le poids, la pression artérielle, le rythme
cardiaque, la température ainsi que d'éventuelles observations. Le médecin prescrit au patient
les analyses complémentaires indiquées pour lui sur la liste des visites.
 Avant de quitter la chambre du patient, le médecin vérie les informations portées par l'inrmière sur la che du patient, il corrige éventuellement ce qui doit l'être, puis signe la che, ce
qui la valide. C'est le médecin qui est responsable du contenu de la che.
2. Tailles équivalentes signie que les eectifs n1 et n2 de deux groupes doivent vérier 95% ≤
n1
n2
≤ 105%.
10.5. L'ESSAI CLINIQUE MEDICALCARE 183
 Une fois les visites du jour terminées, le médecin et l'inrmière passent au bureau de l'essai
clinique. L'inrmière dépose les ches individuelles de chaque patient. Le médecin vérie (et
donc corrige ou conrme) les ches qu'il a remplies un jour précédent, et que l'ARC lui
demande de vérier parce qu'elles contenaient des données incohérentes.
 Dans la journée, les patients qui se sont vus prescrire des examens complémentaires passent
les réaliser dans les diérents labos prévus à cet eet. Le biologiste (analyses de sang) le
neurologue (EEG) et le kiné (tests d'eort) déposent en soirée au bureau de l'essai clinique
les résultats des analyses pour tous les patients qu'ils ont vus dans la journée.
 En n d'après midi, la pression artérielle, le rythme cardiaque de chaque patient sont reprises
et notées par l'inrmière.
 En n de soirée, l'ARC enregistre dans le logiciel les résultats des ches de visite et d'examens
complémentaires remplies le jour même par les diérents acteurs du centre (médecin de jour,
neurologue, etc.). Il arrive que le data manager lui signale des erreurs ou des incohérences
dans les ches. Dans ce cas, il détermine à partir de la che papier si le problème vient d'une
erreur de saisie. Dans ce cas, il modie la donnée enregistrée. Dans le cas contraire, il demande
au médecin ou à l'auxiliaire médical qui l'a signée de vérier les informations inscrites sur la
che papier.
Quelques remarques annexes.
1. Le résultat d'une analyse de sang est la donnée de 6 concentrations (cholesterol, glycémie,
plaquettes, etc.). Si au moins 3 des concentrations sont hors normes, l'analyse de sang doit
être refaite le jour même au moins au moins 4 heures plus tard. Les résultats de toutes les
prises de sang doit être conservés. Pour chacune de ces concentrations c, le commanditaire
fournit deux intervalles [am, aM] et [nm, nM], avec am ≤ nm < nM ≤ aM : c ∈ [nm, nM] signie
que la valeur est normale, c ̸∈ [nm, nM]∧c ∈ [am, aM] signie que la valeur est anormale, mais
acceptable, c ̸∈ [am, aM] signie que la valeur n'a pas de sens, et correspond à une erreur de
mesure ou de saisie.
2. Le résultat d'un électro-encéphalogramme est une valeur de 1 à 9 attribuée par le neurologue.
Si deux valeurs consécutives sont inférieures à 4, un électro-encéphalogramme doit être eectué
à nouveau dès le lendemain.
3. Le résultat d'un test d'eort est la valeur du rythme cardiaque juste avant et juste après
l'eort, ainsi qu'après une minute de repos après l'eort.
4. Les patients étant tous adultes, on considère que leur taille ne varie pas pendant l'essai clinique.
5. Chaque patient se voit prescrire une analyse de sang le premier jour de l'étude. La prescription
est ensuite renouvelée tous les 6 jours.
6. Chaque patient se voit prescrire un test d'eort le premier jour de l'étude. La prescription est
ensuite renouvelée tous les 3 jours.
7. Chaque patient se voit prescrire un EEG le premier jour de l'étude. La prescription est ensuite
renouvelée tous les 5 jours.
8. Dans le cas où un patient prend par erreur un lot diérent de celui prévu dans le plan initial
de prise, il est exclu de l'essai clinique si l'erreur a une incidence sur la composition du lot.
9. L'ensemble des examens complémentaires réalisé un jour donné doit être re-programmé dès le
lendemain si le médecin conrme après vérication la saisie d'une valeur hors-norme.
10. si un examen complémentaire a été eectué mais n'a pas été saisi par l'attaché de recherche
clinique, celui-ci doit être re-programmé le dès le lendemain.
11. Tous les patients ont la panoplie complète des examens complémentaires le premier jour de
leur participation à l'étude.
12. Les maladies à risques réduisent d'un tiers le délai entre deux EEG, de moitié le délai entre
deux prises de sang, et de 1 jour le délai entre 2 tests d'eort.
184 CHAPITRE 10. SUJET DE PROJET PÉDAGOGIQUE DE MASTER 1
Ce projet s'appuie sur un fonctionnement non optimal, où la part de l'informatisation est limitée. On
veut construire un système plus sûr, sans papier, permettant de tracer les interventions, et adapté
au mieux à l'activité de chacun.
On décide de travailler en mode agile, avec une construction incrémentale du prototype. Pour cela,
on a priorisé l'activité des diérents membres du centre d`investigation, à partir de l'édition des listes
de visite jusqu'à la saisie des résultats d'analyse et leur validation.
Le peuplement des bases de données par les données de producton et l'extraction des données a
