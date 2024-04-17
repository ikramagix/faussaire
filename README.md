# Faussaire

**Faussaire** is a modern alternative to the popular Faker gem in Ruby, tailored for more local-specific data generation. It supports French, Greek, and a minimalistic version in English named Globish, offering more realistic and culturally relevant data generation for developers.

## Why using Faussaire if Faker already exists ?

**Faussaire** was developed with specific goals in mind:

- 🇫🇷 **French:** To provide comprehensive and realistic French data, improving upon the sometimes generic output of Faker. This effort also aims to showcase French cultural heritage to a global audience.
- 🇬🇷 **Greek:** Despite being spoken by 15 million people, Greek is often overlooked due to its unique alphabet. **Faussaire** includes support for Greek to address this gap.
- 🌍 **Globish:** In an increasingly globalized world, a "globish" approach is essential. **Faussaire** offers localized data where relevant while maintaining English to ensure broad usability.

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

Here are a complete overview of Faussaire's diversity when it comes to generating fake data:

### Example (example.rb)

```ruby
```

### Address (address.rb)

```ruby
# Generate a random city name in France
puts Faussaire::Address.city  # e.g., "Marseille"

# Generate a random street name
puts Faussaire::Address.street_name  # e.g., "Rue de Rivoli"

# Generate a complete random address
puts Faussaire::Address.full_address

# e.g., "49 Boulevard Pierre Cabanne, 86000 Bavincourt, Deux-Sèvres (76), Région Hauts-de-France"

```

### Name (name.rb)

```ruby
# Generate a random French female first name
puts Faussaire::Name.female_first_name  # e.g., "Élise"

# Generate a random French male first name
puts Faussaire::Name.male_first_name  # e.g., "Régis"

# Generate a random French family name
puts Faussaire::Name.family_name  # e.g., "Dupont"

# Generate a random French full name
puts Faussaire::Name.name  # Outputs: "Pauline Rey"
```

## Development

To set up the development environment for **Faussaire**:

1. Clone the repository:
   ```bash
   git clone https://github.com/ikramagic/faussaire.git
   ```
2. Navigate to the project directory:
   ```bash
   cd faussaire
   ```
3. Install dependencies:
   ```bash
   bin/setup
   ```
4. To run tests:
   ```bash
   rake spec
   ```

## License

The **Faussaire** gem is released under the [MIT License](https://opensource.org/licenses/MIT) with restrictions applying to the dataset used in this project. The [MIT License](https://opensource.org/licenses/MIT), which provides broad permission to use, modify, and distribute the software contained within this gem but this applies to the software itself, if it were to be used with a different dataset.

## Important Information Regarding Data Ownership & Usage

**Faussaire** is released under the [MIT License](https://opensource.org/licenses/MIT), which provides broad permission to use, modify, and distribute the software contained within this gem. See the [LICENSE](https://github.com/ikramagic/faussaire/LICENSE) file for more details.

The dataset used by the **Faussaire** gem is the property of the original creator and protected under intellectual property laws. While **Faussaire** itself can be freely used under the terms of its MIT License, specific conditions apply to the dataset:

- **Dataset cloning and usage:** If you wish to use the dataset or any part of **Faussaire** dataset to develop similar tools or other tools, you must obtain explicit authorization. Please 📫 get in touch: [em@il me](mailto:ikrame.saadi@gmail.com) and let's discuss your fantastic idea together!

- **Commercial Use:** Any commercial use of the **Faussaire** dataset or the tool itself requires compliance with the licensing terms and might necessitate additional permissions or agreements. Please contact the above email for inquiries.

## Contributing

Contributions to **Faussaire** very appreciated! 

Whereas it's for enriching the dataset with a brilliant new addition or anihilating this bug you spotted with your neurons, feel free to contribute by opening issues or creating pull requests:

- **Issues:** Provide details about the issue and how to reproduce it.
- **Pull Requests:** Include a clear explanation of changes and reference any relevant issues.

Please see [CONTRIBUTING.md](https://github.com/ikramagic/faussaire/CONTRIBUTING.md) for more details.