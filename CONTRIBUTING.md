# Become a Faussaire: Contributing Guidelines

Bonjour mighty programmer! 👋 Thinking about contributing to Faussaire? That’s awesome! Whether you’re a seasoned dev or just a beginner looking to practice, we’re excited to see what you’ll come up with. To keep things running smoothly, we’ve got a few guidelines for you. 

> [!NOTE]
> These are just guidelines—nothing here is set in stone. If you’ve got something cool to add, don’t be shy! Well-documented pull requests are always welcome, even if you don’t check every box below. We’re here to learn and have fun, after all! 😄


<p align="center">
  <a href="#Français" style="text-decoration:none;">
    <button>
      Évidemment, vous pouvez aussi me lire en français. On est là pour ça, non ?
    </button>
    <img src="bonjour.png" alt="Français" width="50" height="50">
  </a>
</p>

## Guidelines

1. **Tests, Tests, Tests:**
   - Every new feature, bug fix, or data addition needs to come with tests. 
   - Make sure your tests cover all the important stuff and that they pass before you submit your pull request. We love seeing those green checkmarks! ✅

> [!IMPORTANT]
> Testing for duplicate values and data integrity is a must to ensure the gem runs smoothly.

2. **Keep It Original:**
   - Your contributions should be original and crafted with care. We put a lot of love into this project, and we hope you will too! 💖
   - **No AI-generated data** and definitely **no direct copy-pasting** without some thoughtful formatting or adapting.

> [!TIP]
> Whatever you add should fit within the French vibe we’ve got going here. At the very least, it should be written in French. 🇫🇷

3. **Update the README:**
   - Added something new? Awesome! Just don’t forget to update the `README.md` so others know how to use it (and that it exists!). 👀

> [!NOTE]
> Stick to the current format so everything stays neat and easy to follow.

4. **Relevance:**
   - We’ve had enough of lorem ipsum—Faussaire is both serious & fun but definitely not boring, and we’d love to keep it that way!
   - If you’re looking to practice or contribute, we recommend focusing on cultural themes like poets, quotes, sentence generators, specific brands, etc. We’re all about fun, business, and art here at Faussaire (even if the "crew" is currently...shhh, don’t tell anyone).

> [!IMPORTANT]
> Got something interesting? Great! Just keep it in French... For now!

   - While our main focus is on French, we’re open to all kinds of topics and languages. And who knows, maybe a Greek version is on the horizon! Wink wink!

5. **Code Comments:**
   - Your code should be well-commented to ensure clarity and maintainability.

> [!TIP]
> While we prefer code to be written in English (because it’s just good practice, and we actually love foreign languages), we’re totally cool with comments in French given the nature of the app.

   ```ruby
   require 'yaml'

   module Faussaire
     class Music
       DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

       ##
       # Fetches and samples data based on the provided key. If the fetched data is an array,
       # it samples a single item, otherwise returns the data directly.
       #
       # @param key [String] The dot-separated key used to access the data.
       # @return [Object, nil] The data fetched and optionally sampled.
       #
       def self.fetch(key)
         data = YAML.load_file(DATA_PATH)
         result = data.dig(*key.split('.'))
         result.is_a?(Array) ? result.sample : result
       end

       ##
       # Produces a random house song.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.house #=> "House is a feeling - LA Riots"
       #
       def self.house
         fetch('fr.faussaire.music.house')
       end

       ##
       # Produces a random French rap song.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.rap #=> "Onizuka - PNL"
       #
       def self.rap
         fetch('fr.faussaire.music.rap')
       end

       ##
       # Produces a random French variété song.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.variete #=> "Laisse tomber les filles - France Gall"
       #
       def self.variete
         fetch('fr.faussaire.music.variete')
       end
     end
   end
   ```

## How to Submit Your Contribution

1. Fork the repository and create your feature branch: `git checkout -b a-great-idea-from-toi`
2. Make your changes, ensuring you follow the guidelines above.
3. Commit your changes: `git commit -am 'Added set of ridiculous quotes from French politicians and/or French fashion brands'`
4. Push to the branch: `git push origin a-great-idea-from-toi`
5. Submit a pull request.

> [!TIP]
> That’s it! We’re thrilled to see what you’ll add to Faussaire. Also, fun fact: The “Faussaire crew” currently consists of...well, just me. But hey, that means learning by doing is really a thing so keep going! Don't give up!

Merci beaucoup for helping out and making Faussaire even better!

<a name="Français"></a>

# Devenir un Faussaire : Guide de Contribution

Salut ! 👋 Vous pensiez contribuer à Faussaire ? Génial ! Que vous soyez un(e) dev expérimenté(e) ou un(e) débutant(e) cherchant à pratiquer, on a hâte de voir ce que vous allez proposer. Pour que tout se passe bien, voici quelques règles simples à suivre.

> [!NOTE]
> Ce ne sont QUE des lignes directrices—rien de plus. Si vous avez une super idée, n’hésitez pas ! Les pull requests bien documentées sont toujours les bienvenues, même si vous ne cochez pas toutes les "cases" ci-dessous. On est ici pour apprendre et s’amuser, après tout ! 😄


## Les fameuses lignes directrices

1. **Tests, Tests, Tests :**
   - Chaque nouvelle fonctionnalité, correction de bug ou ajout de données doit être accompagné de tests.
   - Assurez-vous que vos tests couvrent bien tout ce qui est important et qu’ils passent avant de soumettre votre pull request. On aime voir du vert dans le terminal ! ✅
   
> [!IMPORTANT]
> Les tests pour éviter les doublons et vérifier l’intégrité des données sont essentiels pour que la gem fonctionne correctement. C'est pour ça qu'on a décidé de les rendre obligatoires.

2. **Restez Original(e) :**
   - Vos contributions doivent être originales et mijotées aux petits oignons. On met beaucoup de 💖 dans ce projet, et on espère que vous en ferez autant !
   - **Pas de données générées par IA** et surtout **pas de copier-coller direct** sans une petite touche perso ou un minimum d’adaptation.

> [!TIP]
> Ce que vous ajoutez doit s’inscrire dans l’esprit que l’on cultive ici: drôle et/ou culturellement enrichissant.

3. **Mettez à jour le README :**
   - Vous avez envoyé la sauce ? Super ! N’oubliez pas de mettre à jour le `README.md` pour que les autres sachent où la trouver (et qu'elle existe !). 👀

> [!NOTE]
> Respectez le format actuel pour que tout reste bien organisé et facile à suivre.

4. **Pertinence :**
   - On en a assez du lorem ipsum—Faussaire, c’est sérieux & fun, mais surtout pas ennuyeux, et on veut que ça reste comme ça !
   - Si vous cherchez à pratiquer la programmation et/ou à contribuer, on vous conseille de vous concentrer sur des thèmes comme la poésie, les citations, les générateurs de phrases (un peu plus corsé), les marques, etc... 
   - Chez Faussaire, on adore rire donc lâchez vous.


![Karine Lemarchand adore rire](jadore-rire.gif)

> [!IMPORTANT]
> Vous avez une idée sympa ? Parfait ! Mais pour l’instant, gardez-la en français !

   - Même si notre priorité reste le français, on est ouverts à d’autres sujets et langues. Et qui sait, peut-être qu’une version grecque est en préparation ! Clin d’œil, clin d’œil !

5. **Commentaires dans le Code :**
   - Votre code doit être bien commenté pour être clair et facile à maintenir.

> [!TIP]
> Même si on préfère que le code soit écrit en anglais (c’est pô juste mais c'est partout pareil), les commentaires en français sont parfaitement OK, vu la nature de l’appli.

   ```ruby
   require 'yaml'

   module Faussaire
     class Music
       DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

       ##
       # Récupère et échantillonne les données en fonction de la clé fournie. Si les données récupérées sont un tableau,
       # il en échantillonne un seul élément, sinon il retourne les données directement.
       #
       # @param key [String] La clé utilisée pour accéder aux données.
       # @return [Object, nil] Les données récupérées et éventuellement échantillonnées.
       #
       def self.fetch(key)
         data = YAML.load_file(DATA_PATH)
         result = data.dig(*key.split('.'))
         result.is_a?(Array) ? result.sample : result
       end

       ##
       # Génère une chanson de house aléatoire.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.house #=> "House is a feeling - LA Riots"
       #
       def self.house
         fetch('fr.faussaire.music.house')
       end

       ##
       # Génère une chanson de rap français aléatoire.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.rap #=> "Onizuka - PNL"
       #
       def self.rap
         fetch('fr.faussaire.music.rap')
       end

       ##
       # Génère une chanson de variété française aléatoire.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.variete #=> "Laisse tomber les filles - France Gall"
       #
       def self.variete
         fetch('fr.faussaire.music.variete')
       end
     end
   end
   ```

## Comment Soumettre Votre Contribution

1. Forkez le dépôt et créez votre branche : `git checkout -b une-super-idee-de-toi`
2. Apportez vos modifications/additions en suivant les recommandations ci-dessus.
3. Commitez vos changements : `git commit -am 'Ajout d'un ensemble de citations ridicules de politiciens français et/ou de marques de luxe françaises'`
4. Poussez sur votre branche : `git push origin une-super-idee-de-toi`
5. Balancez une pull request.

> [!TIP]
> Et voilà ! On a hâte de découvrir ce que vous allez ajouter à Faussaire. D'ailleurs vous allez rire : "on", la "team Faussaire"... c'est personne, il n'y a que moi. Oui, j'aime la danse, la forêt et la solitude.


Mais bon, ça prouve que l’apprentissage par la pratique, ça marche vraiment, alors continuez ! Ne lâchez rien ! 😉

![Cuphead saying thank you](CUPHEAD.gif)