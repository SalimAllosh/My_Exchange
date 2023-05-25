# My Exchange App


  
Currency Exchange and Gold Price Tracker (Clean Architecture)

The Currency Exchange and Gold Price Tracker is a robust program that follows the principles of **Clean Architecture** to provide users with real-time information and analysis on currency exchange rates and gold prices, specifically tailored for the Swedish Krona (SEK). The program offers multi-language support (Swedish, English, and Arabic) and incorporates three types of error handling (server errors, no internet connection, and no saved data). It also includes dark mode, memorize mode, and automatic language and mode detection to enhance the user experience.

# Key Features:

1. **Clean Architecture:** The program follows the principles of Clean Architecture, separating the core business logic from external dependencies and infrastructure. This architecture ensures modularity, testability, and maintainability, making it easier to adapt and extend the program's functionality in the future.
    
2.  **Currency Exchange Rates:** The program fetches up-to-date currency exchange rates, focusing on the Swedish Krona, from reliable sources. Following Clean Architecture, this feature is implemented as a use case within the program's core business logic, making it independent of external services and easily testable.


<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMjIzMTk0ZjkwMzM4NDE5MWQ0ODU5NTEwODk4ZTdjNjdjMDljN2U5NCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/peBveETwVyLK5IaOdw/giphy.gif" alt="Currencies Gif">  </p>

3.  **Currency Conversion:** The program allows users to perform currency conversion, with the Swedish Krona (SEK) always available as the base currency. Users can input the desired amount and select the source and target currencies, including the Swedish Krona. The program will provide the converted value based on the latest exchange rates.

<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2U0MDBjY2Q0OWNkNTViM2VjNzYwODg4ODUzOGViMjk1NmY4MTFlMiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/Z5BBd3ZKleqNOHrfxH/giphy.gif" alt="Currencies Gif">  </p>

  
4.  **Gold Price Tracking:** Real-time gold prices, specifically in relation to the Swedish Krona, are provided as another use case within the program's core business logic. By adhering to Clean Architecture principles, this feature remains decoupled from external dependencies, enabling easy modification or replacement of gold price data sources.

<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmMwY2MyZmFlZDA3YzNhNzZhZmM5ZjUxMDc2ODAwYmRlMTc1YmFkMiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/B34y645shKjjydKfok/giphy.gif" alt="Gold Gif">  </p>

    
5.  **Multi-Language Support:** The program supports multiple languages (Swedish, English, and Arabic) to cater to a diverse user base. Clean Architecture ensures that language-related functionalities, such as translations and language selection, are encapsulated within the presentation layer, making them easily adaptable and testable.

<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2ZjNzZkMzcyNGY3ZDFjMDU0YWVhYzc3MzBhYWM2MjIxYTJhZDUzZCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/cWEhDYMZwglkTc7Ske/giphy.gif" alt="Localization Gif">  </p>


6.  **Previous Price Display:** In case of no internet connection, the program allows users to view previous currency exchange rates and gold prices. This functionality ensures that users have access to historical data, enabling them to make informed decisions even when offline.


7. **Value Update on Scroll Down:** The program allows users to update the currency exchange rates and gold prices by simply scrolling down on the screen. This intuitive feature enables users to effortlessly retrieve the latest values without the need for manual refresh or interaction with buttons.

<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNTBhYTVkMWJjY2RjZDYxZjI3NWZmYzM1Mzc3YjhlYTFiNGMwYjhjZSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/foMzb63qkl3oaRm9la/giphy.gif" alt="Localization Gif">  </p>

8. **Currency Search:** The program includes a powerful search feature that enables users to search for specific currencies and retrieve detailed information about them. Users can input the currency code or name and obtain relevant data

<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExODdhNGU5Mzg1ODM1ODdlODg4Njk4ZmM5Njk4NDFmZjVmYzc3Y2MyMiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/FCNikmwgqxBmguigDD/giphy.gif" alt="Localization Gif">  </p>

    
9.  **Error Handling:** The program employs Clean Architecture principles to handle various error scenarios effectively. Server errors, no internet connection, and no saved data are treated as separate error cases, with corresponding use cases and error handling mechanisms in place. Error handling remains separate from the core business logic, promoting maintainability and testability.

 <p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNTFkNTdmZGRlN2EyZDU3NWFkNzU4MmE4ZTc4ZjY0YmUyMmFmZTFmNCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/eIQtHw85XZOSK1e5s5/giphy.gif" alt="Localization Gif"> 
<img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExOWRiYzMzYmIyZGNmZjU4MGI1Nzc2MWEzMWRmMmJhMDg5ZDEyODRkMyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/U9cyCR096p1RN0TxY0/giphy.gif" alt="Localization Gif">

 </p>
    
10.  **Dark Mode:** The program features a dark mode option that provides a visually appealing and comfortable user interface. Following Clean Architecture, this presentation layer feature is decoupled from the core business logic, ensuring flexibility and extensibility.

<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYjEzOWNjNDE0MDliYTgzMDcyMTU2NTI0NzJmZWU5N2M3YzNjZjcyYiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/WgPyzIxhPvIsUrluo9/giphy.gif" alt="Localization Gif">  </p>

    
11.  **Memorize Mode:** The program incorporates a memorize mode that allows users to save their preferred settings, such as language preferences.
<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExY2RmZGFlYjM0Yzc4MDk2YzVlOWFjMmNlMGI3MzA1ZGJmZDQyMTFiNyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/ciCuE6II1wkK2sNW9Q/giphy.gif">  </p>

12.  **Memorize Language:** The program incorporates a memorize Language that allows users to save their preferred settings, such as language preferences.

<p align="center">  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExY2NjMDZkZDg0NWU3YzE2ZGNiMWUzOGFkNjAzODI3MGQ3Njc2NWNkMCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/dTGZ8zy79cKi3ci0Ff/giphy.gif">  </p>
    
13.  **Language and Mode Detection:** The program automatically detects the language preferences of the user's device and adjusts the program's interface accordingly. It also detects the device's mode (light or dark) and aligns its appearance accordingly. Clean Architecture promotes modularity and separation of concerns, enabling easy integration of language and mode detection functionalities within the presentation layer.

    

By adhering to Clean Architecture principles, the Currency Exchange and Gold Price Tracker program achieves a high level of modularity, testability, and maintainability. This architectural approach allows for seamless extension and modification of features while ensuring a clean separation between core business logic and external dependencies. Users can benefit from real-time currency exchange rates and gold prices, multi-language support, error handling, dark mode, memorize mode, and automatic language and mode detection, all within a well-structured and adaptable program.
