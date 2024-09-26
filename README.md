# FAUSSAIRE • Au revoir Lorem Ipsum 😉

### Des données authentiques, des apps réalistes, des seeds ludiques

**Faussaire** est une alternative made in France à la gem [Faker](https://github.com/faker-ruby/faker) en Ruby.

Conçue pour fournir des données plus précises et moins génériques que [Faker](https://github.com/faker-ruby/faker), elle dispose actuellement d'un set français exhaustif, réaliste et culturellement pertinent pour vos projets Ruby francophones.

<p align="center">
  <a href="#english">
  <img src="hello.png" alt="English" width="50" height="50">
    <button>
      Hey! You can also README in English!
    </button>
   <img src="hello.png" alt="English" width="50" height="50">
  </a>
</p>

## Table des matières

- [Pourquoi utiliser Faussaire ?](#pourquoi-utiliser-faussaire-)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Modules Disponibles](#modules-disponibles-dans-faussaire)
- [Développement](#vous-voulez-participer-)
- [Licence](#licence)
- [Contribution](#il-manquerait-pas-un-petit-quelque-chose-)

Nous avons pour projet de proposer une version grecque dans les mois à venir, et peut-être une version "globish".

Quand on aime ce qu’on fait, on aime rendre ça ludique.

Comme moi, ça a dû vous arriver.

Des phases de débogage interminables avec une base de données peuplée de Lorem Ipsum, ça devient vite lassant.

Et puis, comment tester cette REGEX sur le format des adresses françaises si les données de test n’ont pas de numéro de département à 3 chiffres ?

Mince, vous venez d’envoyer votre app en production, mais vous vous rendez compte qu’en excluant les caractères spéciaux, vous avez aussi empêché Stéphane de mettre un accent à son prénom.

La liste est interminable.

Si comme moi, vous en avez marre de la standardisation à outrance et que vous voulez utiliser une librairie francophone, amusante et enrichissante, vous allez adorer Faussaire.

C'est quand même plus drôle d'avoir une liste d'AOC, un générateur de phrases "corporate", des mots d'ancien français où un florilège de candidats désuets de téléralité quand vous testez votre base de données. 

**Faussaire** a été développée avec des objectifs précis en tête:

- _Pertinence culturelle:_ Offrir des données françaises précises et culturellement pertinentes, afin de surpasser les résultats génériques des autres options disponibles.

- _Réalisme:_ Générer des données qui reflètent fidèlement les contextes français, des adresses aux noms, et bien plus encore. Dans la mesure du possible, nous privilégions l'utilisation de données réelles dans un souci d'authenticité.

- _Qualité des données:_ Proposer des options de génération de données soigneusement élaborés, précises et complètes, qu'il s'agisse de contextes professionnels ou de références culturelles.

## Installation

Avant de commencer, vérifiez que Ruby et RubyGems sont bien installés sur votre machine. Vous pouvez utiliser les commandes suivantes :

_Pour Ruby :_

```bash
ruby -v
```

Cela affichera la version de Ruby installée, si Ruby est bien installé.

_Pour RubyGems :_

```bash
gem -v
```

Cela affichera la version de RubyGems installée, si RubyGems est bien installé.

Ensuite, vous pouvez installer **Faussaire** directement via RubyGems :

```bash
gem install faussaire
```

Vous pouvez également l'ajouter à votre Gemfile :

```ruby
gem 'faussaire'
```

et lancez la commande suivante pour l'installer :

```bash
bundle install
```

## Utilisation

Pour utiliser **Faussaire** dans vos applications Ruby, il suffit de charger la gem :

```ruby
require 'faussaire'
```

## Modules Disponibles dans Faussaire

<details>
<summary><strong>Faussaire::Ancien</strong></summary>

Le module `Faussaire::Ancien` permet de générer des noms de figures historiques, de créatures mythologiques et des mots en ancien français. Idéal pour les apps dans des domaines tels que le jeu vidéo, la narration et les applications éducatives.

```ruby
# Génère un nom de créature mythologique aléatoire.
Faussaire::Ancien.creature 
# => "Cocatrix"

# Génère un nom de personnage historique aléatoire.
Faussaire::Ancien.historic_figure 
# => "Napoléon Bonaparte"

# Récupère un mot ancien français aléatoire.
Faussaire::Ancien.words 
# => "niquenoque"
```
</details>

<details>
<summary><strong>Faussaire::Address</strong></summary>

Le module `Faussaire::Address` génère des adresses françaises détaillées. Ce module est particulièrement utile pour les tests, les simulations ou toute application nécessitant des données de localisation réalistes.

```ruby
# Renvoie un nom de ville aléatoire.
Faussaire::Address.city 
# => "Achiet-le-Petit"

# Renvoie un numéro de rue aléatoire jusqu'à 99.
Faussaire::Address.street_number_99 
# => "42"

# Renvoie un numéro de rue aléatoire jusqu'à 999.
Faussaire::Address.street_number_999 
# => "110"

# Renvoie un numéro de rue aléatoire jusqu'à 9999.
Faussaire::Address.street_number_9999 
# => "3695"

# Renvoie un type de rue aléatoire.
Faussaire::Address.street_type 
# => "Avenue"

# Renvoie un nom de rue aléatoire.
Faussaire::Address.street_name 
# => "Charles Trenet"

# Renvoie un nom de département aléatoire.
Faussaire::Address.dpt_name 
# => "Loire"

# Renvoie un numéro de département pour la France métropolitaine.
Faussaire::Address.dpt_number 
# => "25"

# Renvoie un numéro de département pour les DOM-TOM.
Faussaire::Address.dpt_number_other 
# => "971"

# Renvoie un code postal aléatoire au format à cinq chiffres.
Faussaire::Address.postal_code 
# => "31200"

# Renvoie un nom de région aléatoire.
Faussaire::Address.region 
# => "Île-de-France"

# Génère une adresse complète en utilisant divers composants.
Faussaire::Address.full_address 
# => "88 Bourg Daniel Bustaffa, 91360 Prouville, La Réunion (974), Région Haute-Normandie"
```
</details>

<details> 
<summary><strong>Faussaire::Bizness</strong> — <i>Brasseur de vent (phrases "corporate" dénuées de sens) et noms de marques françaises</i></summary>

Le module `Faussaire::Bizness` génère des noms de marques françaises et des phrases clichés du monde de l'entreprise.

```ruby
# Génère un nom de marque française aléatoire.
Faussaire::Bizness.brands
# => "Boulangerie Paul"

# Génère un "charabia corporate" aléatoire.
Faussaire::Bizness.pipotronic
# => "En termes de redynamisation de une globalisation référentielle, un meilleur relationnel permet d'solutionner les nécessités back-office."
```
</details>
 
<details> 
<summary><strong>Faussaire::Citation</strong></summary>

Le module `Faussaire::Citation` génère des proverbes français et des citations philosophiques.

```ruby
# Génère une citation philosophique aléatoire.
Faussaire::Citation.philo 
# => "Homère a dit un jour : Le sommeil et la mort sont des frères jumeaux."

# Génère un proverbe français aléatoire.
Faussaire::Citation.proverbe 
# => "Pense deux fois avant de parler, tu en parleras deux fois mieux."
```
</details>

<details>
<summary><strong>Faussaire::Cosmos</strong></summary>

Le module `Faussaire::Cosmos` génère des données liées aux corps célestes, aux planètes et aux événements cosmiques.

```ruby
# Génère un nom de planète aléatoire.
Faussaire::Cosmos.planet 
# => "Neptune"

# Génère un événement cosmique aléatoire.
Faussaire::Cosmos.event 
# => "Pluie de météorites"

# Génère un nom de quartier dans le cosmos (comme une galaxie ou une nébuleuse).
Faussaire::Cosmos.neighborhood 
# => "Filament de Perseus-Pisces"

# Génère un nom d'exploration spatiale aléatoire.
Faussaire::Cosmos.exploration 
# => "Voyager 2"
```
</details>

<details>
<summary><strong>Faussaire::Creamerie</strong></summary>

Le module `Faussaire::Creamerie` génère des données liées aux produits laitiers français, parfait pour des applications ou des démonstrations liées à l'alimentation.

```ruby
# Génère un type de lait al

éatoire.
Faussaire::Creamerie.milk_type 
# => "Lait de bufflonne"

# Génère un beurre aléatoire.
Faussaire::Creamerie.butter 
# => { name: "Beurre d'Isigny", type: "demi-sel" }

# Génère des informations sur les principaux producteurs de beurre.
Faussaire::Creamerie.butter_producers 
# => "N°7: Turquie (215,431 t)"

# Génère un fromage aléatoire, en le liant à une région et une appellation.
Faussaire::Creamerie.cheese 
# => { type: "AOP", name: "Camembert de Normandie", region: "Normandie" }
```
</details>

<details>
<summary><strong>Faussaire::Gardinerie</strong></summary>

Le module `Faussaire::Gardinerie` est certifié bio! Des légumes, des fruits et diverses plantes, avec un accent particulier sur leur pertinence en France.

```ruby
# Génère un nom de légume aléatoire et son mois de consommation idéal en France.
Faussaire::Gardinerie.vegetable 
# => "Carotte (Mars)"

# Génère un nom de fruit aléatoire et son mois de consommation idéal en France.
Faussaire::Gardinerie.fruit 
# => "Pomme (Janvier)"

# Génère un nom de mauvaise herbe nuisible (nuisible pour l'agriculture).
Faussaire::Gardinerie.rival_plant 
# => "Orobanche minor de la famille des Orobanchaceae, parasite sur légumineuses, tabac, carottes, cultures diverses, très répandus dans les régions tempérées"

# Génère un nom de plante carnivore aléatoire.
Faussaire::Gardinerie.bang_bang_plant 
# => "Drosera : pièges à mucilage avec feuilles et poils qui s'enroulent autour des proies"

# Génère un nom de plante psychotrope aléatoire.
Faussaire::Gardinerie.very_naughty_plant 
# => "Nymphaea caerulea : Lotus bleu d’Égypte, plante aux effets enivrants et psychoactifs"
```
</details>

<details>
<summary><strong>Faussaire::Music</strong></summary>

Le module `Faussaire::Music` génère des données liées à différents genres musicaux avec de la house, du rap français et des chansons de variété française.

```ruby
# Génère une chanson de house aléatoire.
Faussaire::Music.house 
# => "House is a feeling - LA Riots"

# Génère une chanson de rap français aléatoire.
Faussaire::Music.rap 
# => "Chez nous - Sultan"

# Génère une chanson de variété française aléatoire.
Faussaire::Music.variete 
# => "Mourir sur scène - Dalida"
```
</details>

<details>
<summary><strong>Faussaire::Name</strong></summary>

Le module `Faussaire::Name` génère des noms français réalistes, qui peuvent être utilisés pour la création de personnages, le remplissage de bases de données, ou toute application nécessitant la génération aléatoire de noms.

```ruby
# Génère un prénom féminin aléatoire.
Faussaire::Name.female_first_name 
# => "Harmonie"

# Génère un prénom masculin aléatoire.
Faussaire::Name.male_first_name 
# => "Jean-Claude"

# Génère un nom de famille aléatoire.
Faussaire::Name.family_name 
# => "Boyer"

# Génère un nom complet en combinant un prénom aléatoire (féminin ou masculin) avec un nom de famille.
Faussaire::Name.name 
# => "Jeanne Gaillard"
```
</details>

<details>
<summary><strong>Faussaire::Tv</strong></summary>

Le module `Faussaire::Tv` génère des données factices liées à la télévision, y compris des titres d'émissions, des influenceurs, des couples célèbres, des chaînes TV, ainsi que des détails spécifiques liés au Festival de Cannes.

```ruby
# Génère un titre d'émission de télévision aléatoire.
Faussaire::Tv.show 
# => "Marjolaine et les Millionnaires"

# Génère un nom d'influenceur célèbre aléatoire.
Faussaire::Tv.influencer 
# => "Le Vrai Bouseuh (Romain Goisbeau)"

# Génère un couple célèbre de la télévision aléatoire.
Faussaire::Tv.famous_couples 
# => "J.Lo et Diddy (2000)"

# Génère un nom de chaîne TV aléatoire.
Faussaire::Tv.channel 
# => "Canal+"

# Retourne le nombre total de films présentés au festival.
Faussaire::Tv::FestivalCannes.total_films 
# => 1234

# Génère un pays aléatoire parmi les plus représentés au festival.
Faussaire::Tv::FestivalCannes.most_represented_countries 
# => "161 (Royaume-Uni)"

# Génère un pays aléatoire parmi ceux qui ont remporté des récompenses.
Faussaire::Tv::FestivalCannes.awarded_countries 
# => "Grèce (total de 1 récompense)"

# Génère un réalisateur ayant remporté deux Palmes d'Or.
Faussaire::Tv::FestivalCannes.directors_with_two_palms 
# => "Ken Loach (Le vent se lève, Moi, Daniel Blake)"

# Génère un nominé ayant reçu plusieurs récompenses.
Faussaire::Tv::FestivalCannes.multiple_awardises 
# => "Dean Stockwell: Le Génie du mal, Long voyage vers la nuit"

# Génère un gagnant de la Palme d'Or.
Faussaire::Tv::FestivalCannes.winners 
# => "Les Meilleures Intentions (Den Goda viljan) par Bille August en provenance de la Suède [1992]"

# Retourne un chiffre du box-office parmi les films du festival.
Faussaire::Tv::FestivalCannes.box_office 
# => "Apocalypse Now (1979) : 4 537 000 entrées"
```
</details>

<details>
<summary><strong>Faussaire::Wine</strong></summary>

Le module `Faussaire::Wine` génère des données liées aux vins français (noms de vins avec leur dénomination actuelle, types, bouteilles, régions, prix, et liqueurs).

```ruby
# Génère un nom de vin aléatoire.
Faussaire::Wine.name 
# => "AOC Collioure"

# Génère un type de vin ou un style de vin aléatoire.
Faussaire::Wine.type 
# => "Vin tranquille blanc (pression inférieure à 0,5 bar à 20°C)"

# Génère un type de bouteille de vin aléatoire.
Faussaire::Wine.bottle_type 
# => "Bouteille Clavelien (bouteille en verre à col court, contenance de 0,62 L, corps cylindrique surmonté de larges épaules)"

# Génère une région viticole aléatoire.
Faussaire::Wine.region 
# => "Vignoble de Corse (120M€ en ventes, 2.45€/bt en prix moyen, 1.71€/m² en rentabilité)"

# Génère un prix de vin aléatoire avec 99 centimes et le symbole Euro (€).
Faussaire::Wine.price 
# => "39.99€"

# Génère un nom de liqueur aléatoire.
Faussaire::Wine.licocorico 
# => "AOC Grande Champagne (Eau de vie de vin) [Cognac]"
```
</details>

## Vous voulez participer ?

Pour configurer l'environnement de développement pour **Faussaire** :

1. Clonez le dépôt :
   ```bash
   git clone https://github.com/ikramagix/faussaire.git
   ```
2. Accédez au répertoire du projet :
   ```bash
   cd faussaire
   ```
3. Installez les dépendances :
   ```bash
   bin/setup
   ```
4. Lancez les tests :
   ```bash
   rake spec
   ```

## Licence

La gem **Faussaire** est disponible sous [Licence MIT](LICENSE.txt), qui vous permet d'utiliser, modifier et distribuer librement le logiciel contenu dans cette gem.

> [!IMPORTANT]
> La Licence MIT concerne uniquement le logiciel lui-même. Des restrictions s'appliquent au jeu de données utilisé dans ce projet (_fr.yml_). Assurez-vous de consulter les conditions spécifiques liées à l'utilisation des données.

## Il manquerait pas un petit quelque chose ?

Toutes les contributions à **Faussaire** sont les bienvenues et le seront toujours !

N'hésitez pas à participer en soumettant vos pull requests :

- **Issues :** Donnez autant de détails que possible sur le problème rencontré et comment le reproduire.
- **Pull Requests :** Vous trouverez la marche à suivre dans [CONTRIBUTING.md](https://github.com/ikramagix/faussaire/blob/main/CONTRIBUTING.md).

Merci à toi camarade faussaire ! 🙂‍

<a name="English"></a>

# FAUSSAIRE • Goodbye Lorem Ipsum 😉

### Authentic French Data for Realistic Apps & Fun Seeding

**Faussaire** is a French-made alternative to the [Faker](https://github.com/faker-ruby/faker) gem in Ruby.

Designed to provide more accurate and less generic data than [Faker](https://github.com/faker-ruby/faker), it currently offers an exhaustive, realistic, and culturally relevant French dataset for your Ruby projects.  

## Table of Contents

- [Why Use Faussaire?](#why-use-faussaire)
- [Installation](#installation)
- [Usage](#usage)
- [Available Modules](#available-modules-in-faussaire)
- [Development](#want-to-contribute)
- [License](#license)
- [Contribution](#is-something-missing)

We plan to offer a Greek version in the coming months, and perhaps a "globish" version.

## Why Using Faussaire ?

When you love what you do, you like to make it fun.

Like me, it has probably happened to you.

Endless debugging phases with a database filled with Lorem Ipsum can quickly become tedious.

And how do you test that REGEX for French addresses if the test data doesn’t include department numbers with 3 digits?

Oops, you’ve just deployed your app to production and realize that by excluding special characters, you’ve also prevented Stéphane from adding an accent to his name.

The list goes on.

If, like me, you're tired of excessive standardization and want to use a francophone, fun, and enriching library, you’re going to love Faussaire.

It’s much more fun to have a list of AOC wines, a corporate buzzword generator, old French words, or a lineup of outdated reality TV candidates when testing your database.

**Faussaire** was developed with specific goals in mind:

- _Cultural Relevance:_ To provide accurate and culturally relevant French data, surpassing the generic results from other available options.

- _Realism:_ To generate data that closely mirrors French contexts, from addresses to names and beyond. Whenever possible, we favor the use of real data for authenticity.

- _Data Quality:_ To offer carefully crafted, precise, and comprehensive data generation options, whether for professional contexts or cultural references.

## Installation

Before you begin, ensure that Ruby and RubyGems are installed on your machine. You can use the following commands:

_For Ruby:_

```bash
ruby -v
```

This will display the installed Ruby version if Ruby is correctly installed.

_For RubyGems:_

```bash
gem -v
```

This will display the installed RubyGems version if RubyGems is correctly installed.

Then, you can install **Faussaire** directly via RubyGems:

```bash
gem install faussaire
```

You can also add it to your Gemfile:

```ruby
gem 'faussaire'
```

and run the following command to install it:

```bash
bundle install
```

## Usage

To use **Faussaire** in your Ruby applications, simply load the gem:

```ruby
require 'faussaire'
```

## Available Modules in Faussaire

<details>
<summary><strong>Faussaire::Ancien</strong></summary>

The `Faussaire::Ancien` module generates names of historical figures, mythological creatures, and old French words. Ideal for apps in areas like video games, storytelling, and educational applications.

```ruby
# Generates a random mythological creature name.
Faussaire::Ancien.creature 
# => "Cocatrix"

# Generates a random historical figure name.
Faussaire::Ancien.historic_figure 
# => "Napoléon Bonaparte"

# Retrieves a random old French word.
Faussaire::Ancien.words 
# => "niquenoque"
```
</details>

<details>
<summary><strong>Faussaire::Address</strong></summary>

The `Faussaire::Address` module generates detailed French addresses. This module is particularly useful for testing, simulations, or any application requiring realistic location data.

```ruby
# Returns a random city name.
Faussaire::Address.city 
# => "Achiet-le-Petit"

# Returns a random street number up to 99.
Faussaire::Address.street_number_99 
# => "42"

# Returns a random street number up to 999.
Faussaire::Address.street_number_999 
# => "110"

# Returns a random street number up to 9999.
Faussaire::Address.street_number_9999 
# => "3695"

# Returns a random street type.
Faussaire::Address.street_type 
# => "Avenue"

# Returns a random street name.
Faussaire::Address.street_name 
# => "Charles Trenet"

# Returns a random department name.
Faussaire::Address.dpt_name 
# => "Loire"

# Returns a department number for metropolitan France.
Faussaire::Address.dpt_number 
# => "25"

# Returns a department number for overseas departments.
Faussaire::Address.dpt_number_other 
# => "971"

# Returns a random postal code formatted to five digits.
Faussaire::Address.postal_code 
# => "31200"

# Returns a random region name.
Faussaire::Address.region 
# => "Île-de-France"

# Generates a complete address using various components.
Faussaire::Address.full_address 
# => "88 Bourg Daniel Bustaffa, 91360 Prouville, La Réunion (974), Région Haute-Normandie"
```
</details>

<details> 
<summary><strong>Faussaire::Bizness</strong> — <i>Windbag (nonsensical corporate phrases) and French brand names</i></summary>

The `Faussaire::Bizness` module generates French brand names and cliché corporate phrases.

```ruby
# Generates a random French brand name.
Faussaire::Bizness.brands
# => "Boulangerie Paul"

# Generates random "corporate buzzwords."
Faussaire::Bizness.pipotronic
# => "En termes de redynamisation de une globalisation référentielle, un meilleur relationnel permet d'solutionner les nécessités back-office."
```
</details>
 
<details> 
<summary><strong>Faussaire::Citation</strong></summary>

The `Faussaire::Citation` module generates French proverbs and philosophical quotes.

```ruby
# Generates a random philosopher quote.
Faussaire::Citation.philo 
# => "Homère a dit un jour : Le sommeil et la mort sont des frères jumeaux."

# Generates a random French proverb.
Faussaire::Citation.proverbe 
# => "Pense deux fois avant de parler, tu en parleras deux fois mieux."
```
</details>

<details>
<summary><strong>Faussaire::Cosmos</strong></summary>

The `Faussaire::Cosmos` module generates data related to celestial bodies, planets, and cosmic events.

```ruby
# Generates a random planet name.
Faussaire::Cosmos.planet 
# => "Neptune"

# Generates a random cosmic event.
Faussaire::Cosmos.event 
# => "Pluie de météorites"

# Generates a neighborhood name in the cosmos (like a galaxy or nebula).
Faussaire::Cosmos.neighborhood 
# => "Filament de Perseus-Pisces"

# Generates a random space exploration name.
Faussaire::Cosmos.exploration 
# => "Voyager 2"
```
</details>

<details>
<summary><strong>Faussaire::Creamerie</strong></summary>

The `Faussaire::Creamerie` module generates data related to French dairy products, perfect for food-related applications or demos.

```ruby
# Generates a random type of milk.
Faussaire::Creamerie.milk_type 
# => "Lait de bufflonne"

# Generates a random butter.
Faussaire::Creamerie.butter 
# => { name: "Beurre d'Isigny", type: "demi-sel" }

# Generates information about top butter producers.
Faussaire::Creamerie.butter_producers 
# => "N°7: Turquie (215,431 t)"

# Generates a random cheese, linking it to a region and an appellation.
Faussaire::Creamerie.cheese 
# => { type: "AOP", name: "Camembert de Normandie", region: "Normandie" }
```
</details>

<details>
<summary><strong>Faussaire::Gardinerie</strong></summary>

The `Faussaire::Gardinerie` module is organic-certified! Vegetables, fruits, and various plants, with a particular focus on their relevance in France.

```ruby
# Generates a random vegetable name and its ideal consumption month in France.
Faussaire::Gardinerie.vegetable 
# => "Carotte (Mars)"

# Generates a random fruit name and its ideal consumption month in France.
Faussaire::Gardinerie.fruit 
# => "Pomme (Janvier)"

# Generates a harmful weed name (harmful for agriculture).
Faussaire::Gardinerie.rival_plant 
# => "Orobanche minor de la famille des Orobanchaceae, parasite sur légumineuses, tabac, carottes, cultures diverses, très répandus dans les régions tempérées"



# Generates a random carnivorous plant name.
Faussaire::Gardinerie.bang_bang_plant 
# => "Drosera : pièges à mucilage avec feuilles et poils qui s'enroulent autour des proies"

# Generates a random psychotropic plant name.
Faussaire::Gardinerie.very_naughty_plant 
# => "Nymphaea caerulea : Lotus bleu d’Égypte, plante aux effets enivrants et psychoactifs"
```
</details>

<details>
<summary><strong>Faussaire::Music</strong></summary>

The `Faussaire::Music` module generates data related to different music genres, focusing on house, French rap, and French variété songs.

```ruby
# Generates a random house song.
Faussaire::Music.house 
# => "House is a feeling - LA Riots"

# Generates a random French rap song.
Faussaire::Music.rap 
# => "Chez nous - Sultan"

# Generates a random French variété song.
Faussaire::Music.variete 
# => "Mourir sur scène - Dalida"
```
</details>

<details>
<summary><strong>Faussaire::Name</strong></summary>

The `Faussaire::Name` module generates realistic French names, which can be used for character creation, database seeding, or any application requiring random name generation.

```ruby
# Generates a random female first name.
Faussaire::Name.female_first_name 
# => "Harmonie"

# Generates a random male first name.
Faussaire::Name.male_first_name 
# => "Jean-Claude"

# Generates a random family name.
Faussaire::Name.family_name 
# => "Boyer"

# Generates a full name by combining a random first name (female or male) with a family name.
Faussaire::Name.name 
# => "Jeanne Gaillard"
```
</details>

<details>
<summary><strong>Faussaire::Tv</strong></summary>

The `Faussaire::Tv` module generates fake data related to television, including show titles, influencers, famous couples, TV channels, and specific details related to the Cannes Film Festival.

```ruby
# Generates a random television show title.
Faussaire::Tv.show 
# => "Marjolaine et les Millionnaires"

# Generates a random famous influencer name.
Faussaire::Tv.influencer 
# => "Le Vrai Bouseuh (Romain Goisbeau)"

# Generates a random famous television couple.
Faussaire::Tv.famous_couples 
# => "J.Lo et Diddy (2000)"

# Generates a random TV channel name.
Faussaire::Tv.channel 
# => "Canal+"

# Returns the total number of films presented at the festival.
Faussaire::Tv::FestivalCannes.total_films 
# => 1234

# Generates a random country among the most represented at the festival.
Faussaire::Tv::FestivalCannes.most_represented_countries 
# => "161 (Royaume-Uni)"

# Generates a random country among those that have won awards.
Faussaire::Tv::FestivalCannes.awarded_countries 
# => "Grèce (total de 1 récompense)"

# Generates a director who has won the Palme d'Or twice.
Faussaire::Tv::FestivalCannes.directors_with_two_palms 
# => "Ken Loach (Le vent se lève, Moi, Daniel Blake)"

# Generates a nominee who has received multiple awards.
Faussaire::Tv::FestivalCannes.multiple_awardises 
# => "Dean Stockwell: Le Génie du mal, Long voyage vers la nuit"

# Generates a Palme d'Or winner.
Faussaire::Tv::FestivalCannes.winners 
# => "Les Meilleures Intentions (Den Goda viljan) par Bille August en provenance de la Suède [1992]"

# Returns a top box office figure from the festival's films.
Faussaire::Tv::FestivalCannes.box_office 
# => "Apocalypse Now (1979) : 4 537 000 entrées"
```
</details>

<details>
<summary><strong>Faussaire::Wine</strong></summary>

The `Faussaire::Wine` module generates data related to French wines (wine names with their current appellation, types, bottles, regions, prices, and liquors).

```ruby
# Generates a random wine name.
Faussaire::Wine.name 
# => "AOC Collioure"

# Generates a random wine type or style.
Faussaire::Wine.type 
# => "Vin tranquille blanc (pression inférieure à 0,5 bar à 20°C)"

# Generates a random wine bottle type.
Faussaire::Wine.bottle_type 
# => "Bouteille Clavelien (bouteille en verre à col court, contenance de 0,62 L, corps cylindrique surmonté de larges épaules)"

# Generates a random wine region.
Faussaire::Wine.region 
# => "Vignoble de Corse (120M€ en ventes, 2.45€/bt en prix moyen, 1.71€/m² en rentabilité)"

# Generates a random wine price with 99 cents and the Euro (€) symbol.
Faussaire::Wine.price 
# => "39.99€"

# Generates a random liquor name.
Faussaire::Wine.licocorico 
# => "AOC Grande Champagne (Eau de vie de vin) [Cognac]"
```
</details>

## Want to contribute?

To set up the development environment for **Faussaire**:

1. Clone the repository:
   ```bash
   git clone https://github.com/ikramagix/faussaire.git
   ```
2. Navigate to the project directory:
   ```bash
   cd faussaire
   ```
3. Install dependencies:
   ```bash
   bin/setup
   ```
4. Run the tests:
   ```bash
   rake spec
   ```

## License

The **Faussaire** gem is available under the [MIT License](LICENSE.txt), which allows you to freely use, modify, and distribute the software contained within this gem.

> [!IMPORTANT]
> The MIT License only applies to the software itself. Restrictions apply to the dataset used in this project (_fr.yml_). Be sure to review the specific terms related to data usage.

## Is something missing?

All contributions to **Faussaire** are welcome and will always be!

Feel free to participate by submitting your pull requests:

- **Issues:** Provide as many details as possible about the problem encountered and how to reproduce it.
- **Pull Requests:** Check out [CONTRIBUTING.md](https://github.com/ikramagix/faussaire/blob/main/CONTRIBUTING.md).

Merci beaucoup, fellow faussaire! 🙂‍