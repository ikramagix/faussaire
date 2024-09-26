# Faussaire — Au revoir Lorem Ipsum: Des données authenthiques, des apps réalistes, des seeds ludiques 

<p align="center">
  <a href="#english-version">README in English!
    <img src="image-1.png" alt="English" width="24" height="24">
  </a>
</p>

---

**Faussaire** est une alternative made in France à la gem [Faker](https://github.com/faker-ruby/faker) en Ruby, qui est elle-même une adaptation de [Perl's Data::Faker library](https://metacpan.org/pod/Data::Faker).

Conçue pour fournir des données plus précises et moins génériques que [Faker](https://github.com/faker-ruby/faker), elle dispose actuellement d'un set français exhaustif, réaliste et culturellement pertinent pour vos projets Ruby francophones.

Nous avons pour projet d'offrir une version grecque dans les mois à venir, ainsi qu'une version "globish" pour animer la phase parfois laborieuse de test et seeds avec des propositions suprenantes.

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

## Modules Disponibles

<details>
<summary><strong>Faussaire::Ancien</strong> — Données historiques et mythologiques</summary>

Le module `Faussaire::Ancien` permet de générer des noms de figures historiques, de créatures mythiques et des mots en ancien français. Idéal pour les apps dans des domaines tels que le jeu vidéo, la narration et les applications éducatives.

```ruby
# Génère un nom de créature mythique aléatoire.
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