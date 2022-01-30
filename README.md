# Web Test Automation using **Robot Framework**
---
# SUT (system or subject under test)

 https://www.demoblaze.com/index.html

# Details
This framework is using page object model as a pattern structure and BDD (Behavior Driven Development) framework as a testing approach with single gherkin language. It's using 4 folders and 1 file in the root directory.
Furthermore, Data driven approach can also be integrated in this framework
* **pages folder**
    * This folder contains files that initiate all page elements, also their action as objects.
* **steps folder**
    * This folder contains files that initiate any reusable steps.
    * Its steps should have direct relations to specific test files.
* **tests folder**
    * This folder contains testcases
    * It can also contain some reusable steps for specific test cases that use data-driven or gherkin language on the same test files.
* **resources.robot file**
    * This is file for global setup or any reusable logic or steps that are used in steps or test files.
* **result folder**
    * This folder is for saving test results after execution

---

## Setup pre-requisites
### Homebrew
1. Install _[Homebrew](https://brew.sh/)_ in _Terminal_ using the following command
  ```sh
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

### Chromedriver
1. Install _[Chromedriver](https://chromedriver.chromium.org/)_ using _brew_ in _Terminal_ using the following command
  ```sh
  $ brew install chromedriver --cask
  ```

### Python
1. Install _[Python](https://www.python.org/)_ using _brew_ in _Terminal_ using the following command
  ```sh
  $ brew install python
  ```

### Setup Python Path
1. Create and open your .bash_profile or .zshrc from _Terminal_
  ```sh
  $ cd
  $ touch .bash_profile
  $ open -e .bash_profile
  ```
2. Set the _python_ PATH in .bash_profile file
  ```
  PATH="/usr/local/opt/python/libexec/bin:${PATH}"
  export PATH;
  ```
3. Save and exit your bash_profile

### Pip
1. Install _[Pip](https://pypi.org/project/pip/)_ using `easy_install` command
  ```sh
  $ sudo easy_install pip
  $ sudo pip install --upgrade pip
  ```

### Robot Framework
1. Install _[Robot Framework](https://robotframework.org/)_ using _pip_ in _Terminal_ using the following command
  ```sh
  $ pip install robotframework
  ```

### Selenium Library
1. Install _[Selenium Library in Robot Framework](https://github.com/robotframework/SeleniumLibrary)_ using _pip_ in _Terminal_ using the following command
  ```sh
  $ pip install robotframework-seleniumlibrary
  ```

---


## All set, run testcases!
1. From your _Terminal_, go to the project directory
2. Run the test cases using the following command
  ```sh
  $ robot -d result/ tests/
  ```
4. Wait until [tests executing has finished]![img_2.png](img_2.png)
5. See the output of tests result in the result folder then open `log.html` or `report.html` using your browser
6. See the [log of test result] ![img.png](img.png)
7. See the [report of tests result] ![img_1.png](img_1.png)

---
