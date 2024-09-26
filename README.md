# FAUSSAIRE • Au revoir Lorem Ipsum 😉

### Des données authentiques, des apps réalistes, des seeds ludiques

**Faussaire** est une alternative made in France à la gem [Faker](https://github.com/faker-ruby/faker) en Ruby, qui est elle-même une adaptation de [Perl's Data::Faker library](https://metacpan.org/pod/Data::Faker).

Conçue pour fournir des données plus précises et moins génériques que [Faker](https://github.com/faker-ruby/faker), elle dispose actuellement d'un set français exhaustif, réaliste et culturellement pertinent pour vos projets Ruby francophones.

---
<p align="center">
  <a href="#english-version" style="text-decoration:none;">
    <button style="background-color:#4CAF50;border:none;color:white;padding:10px 24px;text-align:center;text-decoration:none;display:inline-block;font-size:16px;border-radius:4px;cursor:pointer;">
      Hey! You can also README in English!
    </button>
    <img src="image-1.png" alt="English" width="14" height="14" style="vertical-align:middle;margin-left:10px;">
  </a>
</p>

## Table des matières

- [Pourquoi utiliser Faussaire ?](#pourquoi-utiliser-faussaire-si-faker-existe-déjà-)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Modules Disponibles](#modules-disponibles-dans-faussaire)
- [Développement](#vous-voulez-participer-)
- [Licence](#licence)
- [Contribution](#il-manquerait-pas-un-petit-quelque-chose-)

Nous avons pour projet de proposer une version grecque dans les mois à venir, et peut-être une version "globish" pour animer la phase parfois laborieuse de test et seeds avec des propositions suprenantes.

## Pourquoi utiliser Faussaire si Faker existe déjà ? 🤔

Quand on aime ce qu'on fait, on aime rendre ça ludique. 

Comme moi, ça a du vous arriver. 

Des phases de débogages interminables avec une base de données peuplée de Lorem Ipsum, ça devient vite lassant. 

Et puis, comment tester cette REGEX sur le format des addresses françaises si les données de tests n'ont pas de numéro de département à 3 chiffres ? 

Mince, vous venez d'envoyer votre app en production mais vous vous rendez compte qu'en excluant les caractères spéciaux, vous avez aussi empêcher Stéphane de mettre un accent à son prénom.

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
<summary><strong>Faussaire::Ancien</strong> — Données historiques et mythologiques</summary>

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
<summary><strong>Faussaire::Address</strong> — Adresses françaises</summary>

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
<summary><strong>Faussaire::Bizness</strong> — Brasseur de vent (phrases "corporate" dénuées de sens) et noms de marques françaises</summary>

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
<summary><strong>Faussaire::Citation</strong> — Proverbes & citations philosophiques</summary>

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
<summary><strong>Faussaire::Cosmos</strong> — Données cosmologiques</summary>

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
<summary><strong>Faussaire::Creamerie</strong> — Données sur les produits laitiers</summary>

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
<summary><strong>Faussaire::Gardinerie</strong> — Fruits, légumes et plantes diverses</summary>

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
<summary><strong>Faussaire::Music</strong> — La Playlist!</summary>

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
<summary><strong>Faussaire::Name</strong> — Noms et prénoms</summary>

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
<summary><strong>Faussaire::Tv</strong> — De la télévision aux influenceurs en passant par le festival de Cannes</summary>

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
<summary><strong>Faussaire::Wine</strong> — Données sur les vins français</summary>

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
> **Veuillez noter :** La Licence MIT concerne uniquement le logiciel lui-même. Des restrictions s'appliquent au jeu de données utilisé dans ce projet (_fr.yml_). Assurez-vous de consulter les conditions spécifiques liées à l'utilisation des données.

## Il manquerait pas un petit quelque chose ?

Toutes les contributions à **Faussaire** sont les bienvenues et le seront toujours !

N'hésitez pas à participer en soumettant vos pull requests :

- **Issues :** Donnez autant de détails que possible sur le problème rencontré et comment le reproduire.
- **Pull Requests :** Consultez [CONTRIBUTING.md](https://github.com/ikramagix/faussaire/blob/main/CONTRIBUTING.md).

Merci à toi camarade faussaire ! 🙂‍↕️

# English Version

# Faussaire — Au revoir Lorem Ipsum: Authentic French Data for Realistic Apps & Fun Seeding

**Faussaire** is a modern alternative to the popular [Faker](https://github.com/faker-ruby/faker) gem in Ruby, which itself is a port of [Perl's Data::Faker library](https://metacpan.org/pod/Data::Faker).

Tailored for more local-specific data generation, it currently fully supports French offering more realistic and culturally relevant data generation for developers.

We aim to support the Greek language in the future, as well as a Globish alternative for universal accessibility.

## Why use Faussaire? Faker already exists! 🤔

**Faussaire** was developed with specific goals in mind:

- **_Cultural Relevance:_** To provide accurate and culturally nuanced French data, improving upon generic outputs from other libraries.
- **_Realism:_** To generate data that closely mirrors real-world French contexts, from addresses to names and beyond. Whenever possible, we prioritize using real data to enhance authenticity.
- **_Detail-Oriented:_** To offer a comprehensive set of data generators covering various aspects of French life, from business to historical references.

## Installation

Before installing, ensure you have Ruby and RubyGems installed on your system. Then, you can install **Faussaire** directly from RubyGems:

```bash
gem install faussaire
```

Or add it to your application's Gemfile:

```ruby
gem 'faussaire'
```

and bundle install:

```bash
bundle install
```

## Usage

To use **Faussaire** in your Ruby applications, require the gem:

```ruby
require 'faussaire'
```

## Available Modules

<details>
<summary><strong>Faussaire::Ancien</strong> — Historical and Mythical Data</summary>

The `Faussaire::Ancien` module provides functionality for generating names and terms associated with historical figures, mythical creatures, and ancient words. It's perfect for content creation in areas such as gaming, storytelling, and educational applications.

```ruby
# Produces a random mythical creature name.
Faussaire::Ancien.creature 
# => "Cocatrix"

# Produces a random historic figure name.
Faussaire::Ancien.historic_figure 
# => "Napoléon Bonaparte"

# Retrieves a random old French word.
Faussaire::Ancien.words 
# => "niquenoque"
```
</details>

<details>
<summary><strong>Faussaire::Address</strong> — French Address Data</summary>

The `Faussaire::Address` module generates realistic and detailed French addresses. This module is particularly useful for testing, simulations, or any application that requires valid location data.

```ruby
# Returns a random city name.
Faussaire::Address.city 
# => "Achiet-le-Petit"

# Returns a random street number up to 99.
Faussaire::Address.street_number_99 
# => "42"

# Generates a complete address using various components.
Faussaire::Address.full_address 
# => "88 Bourg Daniel Bustaffa, 91360 Prouville, La Réunion (974), Région Haute-Normandie"
```
</details>

<details>
<summary><strong>Faussaire::Bizness</strong> — Corporate Cliché Data</summary>

The `Faussaire::Bizness` module provides fake data related to French business names and corporate cliché sentences.

```ruby
# Generates a random French brand name.
Faussaire::Bizness.brands
# => "Boulangerie Paul"

# Generates a random 'corporate word salad'.
Faussaire::Bizness.pipotronic
# => "En termes de redynamisation de une globalisation référentielle, un meilleur relationnel permet d'solutionner les nécessités back-office."
```
</details>

<details>
<summary><strong>Faussaire::Citation</strong> — Proverbs and Philosophical Quotes</summary>

The `Faussaire::Citation` module generates French proverbs and philosophical quotes, maintaining cultural relevance in your application.

```ruby
# Produces a random philosopher quote.
Faussaire::Citation.philo 
# => "Homère a dit un jour : Le sommeil et la mort sont des frères jumeaux."

# Produces a random French proverb.
Faussaire::Citation.proverbe 
# => "Pense deux fois avant de parler, tu en parleras deux fois mieux."
```
</details>

<details>
<summary><strong>Faussaire::Cosmos</strong> — Celestial Data</summary>

The `Faussaire::Cosmos` module generates fake data related to celestial bodies, planets, and cosmic events, useful for science fiction projects or educational tools.

```ruby
# Produces a random planet name.
Faussaire::Cosmos.planet 
# => "Neptune"

# Produces a random cosmic event.
Faussaire::Cosmos.event 
# => "Pluie de météorites"
```
</details>

<details>
<summary><strong>Faussaire::Creamerie</strong> — Dairy Product Data</summary>

The `Faussaire::Creamerie` module generates fake data related to French dairy products, perfect for food-related applications or demos.

```ruby
# Produces a random cheese.
Faussaire::Creamerie.cheese 
# => { type: "AOP", name: "Camembert de Normandie", region: "Normandie" }

# Produces information about top butter producers.
Faussaire::Creamerie.butter_producers 
# => "N°7: Turquie (215,431 t)"
```
</details>

<details>
<summary><strong>Faussaire::Gardinerie</strong> — Gardening Data</summary>

The `Faussaire::Gardinerie` module generates fake data related to gardening, including vegetables, fruits, and various plants, with a focus on their relevance in France.

```ruby
# Produces a random vegetable name and its ideal consumption month in France.
Faussaire::Gardinerie.vegetable 
# => "Carotte (Mars)"

# Produces a random psychotropic plant name.
Faussaire::Gardinerie.very_naughty_plant 
# => "Nymphaea caerulea : Lotus bleu d’Égypte, plante aux effets enivrants et psychoactifs"
```
</details>

<details>
<summary><strong>Faussaire::Music</strong> — French Music Data</summary>

The `Faussaire::Music` module generates fake data related to music genres, particularly focusing on French music, including house, French rap, and French variété songs.

```ruby
# Produces a random French variété song.
Faussaire::Music.variete 
# => "Mourir sur scène - Dalida"
```
</details>

<details>
<summary><strong>Faussaire::Name</strong> — French Name Data</summary>

The `Faussaire::Name` module generates authentic French names, which can be used for character creation, populating databases, or any application requiring random name generation.

```ruby
# Produces a random female first name.
Faussaire::Name.female_first_name 
# => "Harmonie"

# Generates a full name by combining a random first name (either male or female) with a family name.
Faussaire::Name.name 
# => "Jeanne Gaillard"
```
</details>

<details>
<summary><strong>Faussaire::Tv</strong> — Television Data</summary>

The `Faussaire::Tv` module generates fake data related to television, including show titles, influencers, famous couples, TV channels, and specific details related to the Festival de Cannes.

```ruby
# Produces a random television show title.
Faussaire::Tv.show 
# => "Marjolaine et les Millionnaires"

# Returns a random top box office figure from the festival's films.
Faussaire::Tv::FestivalCannes.box_office 
# => "Apocalypse Now (1979) : 4 537 000 entrées"
```
</details>

<details>
<summary><strong>Faussaire::Wine</strong> — French Wine Data</summary>

The `Faussaire::Wine` module generates fake data related to French wines, including wine names, types, bottle types, regions, prices, and liquors (Licocorico).

```ruby
# Produces a random wine name.
Faussaire::Wine.name 
# => "AOC Collioure"

# Produces a random wine price with 99 cents and a Euro (€) symbol.
Faussaire::Wine.price 
# => "39.99€"
```
</details>

## Development

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
4. Run tests:
   ```bash
   rake spec
   ```

## License

The **Faussaire** gem is released under the [MIT License](LICENSE.txt), which provides broad permission to use, modify, and distribute the software contained within this gem. 

However, please note that restrictions apply to the dataset used in this project. The MIT License covers the software itself, particularly if it were to be used with a different dataset.

## Contributing

Contributions to **Faussaire** very appreciated! 

Whereas it's for enriching the dataset with a brilliant new addition or anihilating this bug you spotted with your neurons, feel free to contribute by opening issues or creating pull requests:

- **Issues:** Provide details about the issue and how to reproduce it.
- **Pull Requests:** Include a clear explanation of changes and reference any relevant issues.

You can check [CONTRIBUTING.md](https://github.com/ikramagix/faussaire/blob/main/CONTRIBUTING.md) for more details.

Merci in advance! 🙂‍↕️