
# Currency Converter

This project purpose was to fulfill a task from Arcella company.

It is required to develop a simple Flutter application - a Currency Converter. Below are the detailed specifications for this task: 
 
1- The application should allow users to select a "from" currency and a "to" currency from two separate dropdown menus.  
2- It should provide a text field for users to input the amount they want to convert.  
3- Upon input, the application should display the converted amount based on real-time exchange rates.   
4- The application should have basic error handling for potential network/API errors

## ExchangeRate-API
### you have to register first to there website to get API key
#### with the request below you can GET exchange rates from your base code to all the other currencies they support.

```http
GET https://v6.exchangerate-api.com/v6/YOUR-API-KEY/latest/CURRENCY


/*
  
• Substitute `YOUR-API-KEY` with the API key displayed in your dashboard.

• Substitute `CURRENCY` with the code you want to use as a base currency (ex: USD).

*/
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `YOUR-API-KEY` | `string` | **Required**. Your API key |
| `CURRENCY` | `string` | **Required**. base currency |





## Authors

- [@HozanAgeed](https://github.com/hozan66)


## Screenshots

![p1](https://github.com/hozan66/currency-converter/assets/57224535/e2f2c2eb-8f3b-40dc-95ea-06b61b1d07e2)

![p2](https://github.com/hozan66/currency-converter/assets/57224535/08f99b3f-50ee-423e-b9ea-bb31fcd59510)

![p3](https://github.com/hozan66/currency-converter/assets/57224535/8b8f5afe-86fe-4240-8188-49c8a8905888)

# Logo

![logo](https://github.com/hozan66/currency-converter/assets/57224535/3a2840d7-f403-424e-a473-f8588af5e4b9)

## How to run the application

Folloe this step-by-step guide:

1. **Prerequisites**
   - Make sure you have Flutter and Dart installed on your machine. You can refer to the official Flutter installation guide for instructions on setting up Flutter: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install).
   - Ensure that you have a compatible IDE installed, such as Visual Studio Code (VS Code) or Android Studio, along with their respective Flutter extensions.
   - Set up an Android or iOS emulator, or connect a physical device for testing.

2. **Clone the project**
   - Open a terminal or command prompt.
   - Change your current directory to the desired location where you want to clone the project.
   - Run the following command to clone the project repository:

     ```bash
     git clone https://github.com/hozan66/currency-converter
     ```

3. **Navigate to the project**
   - Change your current directory to the cloned project folder:

     ```bash
     cd currency-converter
     ```

4. **Install dependencies**
   - Run the following command to install the required dependencies:

     ```bash
     flutter pub get
     ```

5. **Run the app**
   - To launch the app on the emulator or physical device, run the following command:

     ```bash
     flutter run
     ```

     This command will automatically detect the connected devices and start the app on the selected target.

   - If you want to run the app on a specific device, you can use the `-d` flag followed by the device ID. For example, to run on a specific Android device:

     ```bash
     flutter run -d deviceID
     ```

     Replace `deviceID` with the appropriate identifier of your target device.

   - The app will now be compiled and deployed to the selected device or emulator. You should see the app running on the screen.

## How the application works (for a user)

The aplication contain two dropdown lists in which the user can determine the base currency probably what he has in hand, the second is the target in which he wants to know.

There is an input text field which correspond to the base currency  choice, another text field is in the bottom  that corrispond to the target currency and the input number in the first text field.

The conversion happen simultaneously, so any change in the base text field will cause the conversion to happen.

Fetching the data from API happen when first opening the app and after that with each change in the base currency.
