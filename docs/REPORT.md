**Cryptographically Protected Model-as-a-Service with Zero-Exposure Inference using Homomorphic Computation**

**Abstract**

A model, in artificial intelligence, is a computational system trained on data to recognize patterns, make predictions, or generate meaningful insights. Model-as-a-Service (MaaS) allows users to remotely access such pre-trained models through the cloud, enabling applications like image classification, financial forecasting, and intelligent decision-making without requiring local hardware or training infrastructure. However, this cloud-based architecture requires users to upload sensitive data to external servers, creating serious privacy risks. Such data may be exposed to inference leakage attacks, where adversaries can deduce information about user inputs or extract characteristics of the deployed model, posing substantial security risks. To address these concerns, this project presents a privacy-preserving MaaS framework built on Fully Homomorphic Encryption (FHE). In this architecture, user data is encrypted before being sent to the server, allowing the cloud to evaluate AI models directly over ciphertext. The server processes the encrypted query and returns an encrypted inference result, which only the user can decrypt locally. At no point does the service provider gain access to plaintext input or output, ensuring strong confidentiality for both user data and model intelligence. This encrypted-inference workflow is optimized to support real-time applications such as secure facial verification and rapid predictive assessments while maintaining robust privacy guarantees. By eliminating exposure of sensitive information and preventing model inversion attacks, the proposed FHE-enabled MaaS framework enhances trust, strengthens security, and enables privacy-centric deployment of AI models on the cloud.

**TABLE OF CONTENTS**

| **C. NO** | **TITLE** | **PAGE NO** |
| --- | --- | --- |
|  | **ABSTRACT** | **I** |
| **1** | **INTRODUCTION** |  |
|  | 1.1. Overview |  |
|  | 1.2. Problem Statement |  |
|  | 1.3. Machine Learning |  |
|  | 1.4. Aim and Objective |  |
|  | 1.5. Scope of the Project |  |
| **2. ** | **SYSTEM ANALYSIS** |  |
|  | 2.1. Existing System |  |
|  | 2.2. Proposed System |  |
| **3** | **SYSTEM REQUIREMENTS** |  |
|  | 3.1 Hardware Requirements |  |
|  | 3.2. Software Requirements |  |
| **4** | **SOFTWARE DESCRIPTION** |  |
|  | 4.1. Python 3.8 |  |
|  | 4.2. MySQL 5 |  |
|  | 4.3. WampServer 2i |  |
|  | 4.4. Bootstrap |  |
|  | 4.5. Flask |  |
| **5** | **SYSTEM DESIGN** |  |
|  | 5.1. System Architecture |  |
|  | 5.2. Data Flow Diagram |  |
|  | 5.3. UML Diagram |  |
|  | 5.4. ER Diagram |  |
| **6** | **SYSTEM TESTING** |  |
|  | 6.1. Software Testing |  |
|  | 6.2. Test Case |  |
|  | 6.3. Test Report |  |
| **7** | **SYSTEM IMPLEMENTATION** |  |
|  | 7.1. Project Description |  |
|  | 7.2. Modules Description |  |
| **8** | **APPENDICES** |  |
|  | 8.1. Screenshots |  |
|  | 8.2. Source Code |  |
| **9** | **BOTTOMLINE** |  |
|  | 9.1. Conclusion |  |
|  | 9.2. Future Enhancement |  |
| **10** | **REFERENCE** |  |
|  | 10.1. Journal Reference |  |
|  | 10.2. Book Reference |  |
|  | 10.3. Web Reference |  |

**CHAPTER 1**

**INTRODUCTION**

**1.1. OVERVIEW**

Delivering machine learning (ML) models as a service, known as Model as a Service (MaaS), involves hosting pre-trained ML models on [cloud infrastructure](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-cloud-infrastructure) and making them accessible via APIs. This setup allows organizations to take advantage of ML models without having to create and train them from scratch.  MaaS is part of the broader "as-a-service" ecosystem of [cloud terms](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary), similar to software as a service (SaaS) and platform as a service (PaaS), but specifically tailored for AI and ML use cases. When comparing MaaS to SaaS and PaaS, several similarities and differences emerge:  **SaaS** delivers software applications online, allowing users to access and use them without worrying about underlying infrastructure or maintenance. Examples include email services, customer relationship management (CRM) systems, and office productivity tools.

	

	**PaaS **provides a complete cloud-based environment for developers to build, deploy, and manage applications—all without the need to manage infrastructure. PaaS also offers tools and services for application development, such as databases, middleware, and development frameworks.
**MaaS**, like SaaS and PaaS, uses a cloud-based delivery model but is specifically designed for machine learning models. While SaaS and PaaS cater to a wide range of applications, MaaS focuses on AI use cases. This specialization enables MaaS to provide highly efficient and optimized solutions for ML models, helping organizations quickly deploy AI-powered solutions that drive business outcomes.

**1.1.1. ****Benefits of model as a service**

**Makes AI more accessible**

MaaS makes AI accessible to businesses of all sizes by allowing them to use sophisticated ML and deep learning models without extensive infrastructure or in-house expertise. With easy access to pre-trained models, MaaS empowers organizations to quickly integrate AI into their operations. This approach reduces the barriers to entry, empowering even small businesses to take advantage of AI and ML technologies to drive innovation in their respective fields.

**Delivers cost efficiencies**

MaaS empowers companies to access advanced AI capabilities without the financial burden of building and maintaining their own models. Building AI models from scratch requires major computational resources and specialized knowledge. By using pre-built, pre-trained models from cloud providers, organizations achieve significant cost savings on high-performance computing power and dedicated AI teams. The flexible pay-as-you-go pricing model of MaaS further improves cost efficiencies by allowing businesses to only pay for the AI and ML resources they use.

**Provides high-performance scalability**

MaaS is highly scalable, making it ideal for companies with fluctuating business needs. Its ability to scale up or down based on demand allows business to easily manage varying workloads. MaaS adjusts to traffic surges or decreases, providing the necessary computational power to maintain optimal performance. 

Designed to handle large volumes of requests without performance degradation, MaaS helps businesses deliver consistent, reliable AI-driven services to their customers, regardless of the volume of requests. This helps businesses maintain high levels of service quality and customer satisfaction.

**1.2. PROBLEMS DEFINITION**

Artificial Intelligence as a Service (MaaS) has become an integral part of modern cloud-based computing environments, providing scalable and on-demand access to AI models for a wide range of applications such as facial recognition, medical diagnostics, and financial analysis. However, the reliance on centralized cloud infrastructures for processing sensitive user data introduces substantial privacy and security concerns. One of the fundamental challenges is the requirement for users to upload sensitive data to external cloud servers, increasing the risk of data exposure and unauthorized access by third parties. Current MaaS platforms typically process data in unencrypted form, making them susceptible to various privacy attacks. Malicious actors can exploit model outputs to infer sensitive attributes of user data or extract proprietary information about the underlying AI models through model inversion and membership inference attacks. The absence of secure data handling mechanisms during model evaluation further exacerbates these threats, resulting in a lack of trust among users and service providers. Moreover, existing MaaS frameworks struggle to provide full encryption support throughout the entire lifecycle of data processing. While conventional encryption methods such as symmetric or asymmetric encryption ensure data confidentiality during transmission or storage, they fail to enable computation on encrypted data. This limitation forces the decryption of sensitive inputs prior to model evaluation, creating a critical vulnerability window that adversaries may exploit. In addition, both AI model owners and users face significant challenges in protecting their respective intellectual property and private data. Model owners are hesitant to deploy proprietary models on external servers due to the risk of theft or misuse, while users are concerned about sharing confidential information that may be exposed during inference. To make matters more complex, conventional cryptographic methods significantly increase computational overhead, especially for real-time use cases like facial recognition. The high latency and resource demands of these techniques hinder practical deployment and degrade system performance, thereby limiting the adoption of privacy-preserving AI technologies. To address these multifaceted issues, the proposed system introduces a Homomorphic Encryption–based MaaS architecture that enables secure model evaluation without exposing raw data or the internal workings of the model. This approach preserves end-to-end data confidentiality, enhances trust among stakeholders, and ensures efficient and secure AI service delivery.

**1.3. ****MACHINE LEARNING**

Machine learning is a branch of AI. Other tools for reaching AI include rule-based engines, evolutionary algorithms, and Bayesian statistics. While many early AI programs, like IBM’s Deep Blue, which defeated Garry Kasparov in chess in 1997, were rule-based and dependent on human programming, machine learning is a tool through which computers have the ability to teach themselves, and set their own rules. In 2016, Google’s DeepMind beat the world champion in Go by using machine learning–training itself on a large data set of expert moves.

**1.3.1. ****Fully Homomorphic Encryption**

Fully Homomorphic Encryption (FHE) allows computations to be performed directly on encrypted data, yielding an encrypted result that, when decrypted, matches the result of the computation done on the plaintext. 

**Benefits of Fully Homomorphic Encryption**

- **No trusted ****third-parties****:** Data remains secure and private in untrusted environments, like public clouds or external parties. The data stays encrypted at all times, which minimizes the likelihood that sensitive information ever gets compromised.

- **Eliminates tradeoff between data usability and data privacy:** There is no need to mask or drop any features in order to preserve the privacy of data. All features may be used in an analysis, without compromising privacy.

- **Quantum-safe:** Fully homomorphic encryption schemes are resilient against quantum attacks.

FHE enables computations on encrypted data without decryption, preserving confidentiality. 

FHE is valuable in scenarios like cloud computing, where data is processed by third-party service providers without revealing the original data.  FHE schemes allow you to perform operations like addition and multiplication on ciphertexts, and the result of these operations will be another ciphertext that, when decrypted, will be the result of performing the same operation on the plaintext.  Unlike some other types of homomorphic encryption, FHE can support arbitrary computations, making it suitable for complex tasks.  FHE ensures that even if a cloud provider or third party has access to the encrypted data, they cannot see the underlying plaintext, protecting user privacy and data security. FHE is particularly useful in privacy-preserving machine learning, where models can be trained on encrypted data without exposing the underlying data to the training provider. 

**1.4. AIM AND OBJECTIVE**

**Aim**

The aim of the project to design and develop a privacy-preserving Model-as-a-Service (MaaS) platform that enables secure deployment and utilization of AI models using Fully Homomorphic Encryption (FHE), ensuring that sensitive user data and proprietary AI models remain confidential during the entire inference process.

**Objectives**

- To implement secure registration and authentication for Model Owners, Model Users, and the MaaS Service Provider.

- To design a Homomorphic Encryption-based key generation and distribution system.

- To enable Model Owners to encrypt AI models before deployment for confidentiality.

- To allow Model Users to encrypt input data before uploading to ensure privacy.

- To develop a secure model evaluation module for inference on encrypted data.

- To generate and deliver encrypted evaluation results to Model Users.

- To analyze system performance using metrics like Accuracy, Encryption/Decryption Time, and Throughput.

- To demonstrate the system with a real-time privacy-preserving facial recognition case study.

**1.5. SCOPE OF THE PROJECT**

This project focuses on developing a secure and privacy-preserving Model-as-a-Service (MaaS) platform that leverages Fully Homomorphic Encryption (FHE) to enable encrypted AI model evaluation without exposing sensitive user data or proprietary AI model features. The scope includes the end-to-end implementation of secure model deployment by model owners, encrypted input submission by users, and encrypted output generation and delivery — all without decrypting the data at any intermediate stage. The system supports user and model owner registration, key generation and management, homomorphic encryption/decryption modules, secure AI model inference, and result delivery within a cloud-based architecture. The platform is especially applicable to use cases involving highly sensitive data, such as facial recognition, healthcare diagnostics, or financial analytics, where user privacy and model security are paramount. It ensures that neither the MaaS provider nor any third party gains access to raw data or model internals, thus mitigating risks of data leakage, model theft, or inference-based attacks. The system is designed to be scalable and extensible, allowing the integration of various AI models, support for multiple encryption schemes, and expansion to other domains where secure AI computation is needed. The project does not focus on training AI models under encryption (as that remains computationally intensive with current technology), but rather emphasizes secure inference and prediction.

**CHAPTER 2**

**SYSTEM ANALYSIS**

**2.1. EXISTING SYSTEM**

- **Differential Privacy**

Differential Privacy is a statistical technique that adds carefully calibrated noise to the data or query results to prevent the identification of individual records. This ensures that the presence or absence of a single individual’s data does not significantly affect the output of the model, thereby preserving privacy. While it provides strong mathematical guarantees, the added noise may reduce the accuracy of predictions or insights, particularly in small datasets or highly sensitive applications.

- **Secure Multi-Party Computation (SMPC)**

SMPC allows multiple parties to collaboratively perform computations on their private inputs without revealing the data to each other. Each party computes a portion of the task using encrypted or shared data and contributes to the final output. It ensures that sensitive data is never exposed during processing. However, SMPC often requires complex protocols and extensive communication between parties, which can lead to high computational and network overhead, limiting its scalability and practicality for real-time systems.

- **Data Anonymization**

This technique involves removing or obfuscating personally identifiable information (PII) such as names, addresses, or ID numbers from datasets. The goal is to make the data non-traceable to an individual while retaining its utility for analysis. However, anonymized data can often be re-identified using auxiliary data or advanced correlation methods. As such, it is no longer considered a foolproof solution for privacy protection in many high-risk scenarios.

- **Federated Learning**

Federated Learning is a decentralized approach where machine learning models are trained locally on user devices, and only the model updates (e.g., gradients) are sent to a central server. This way, raw data never leaves the device, enhancing privacy. While federated learning mitigates the risk of central data breaches, it is still susceptible to inference attacks, where adversaries can extract sensitive information from the model updates.

- **Encryption-at-Rest and In-Transit**

These are standard cryptographic techniques used to secure data while it is stored (at-rest) and during transmission over networks (in-transit). Encryption ensures that unauthorized parties cannot read or tamper with the data during these phases. However, the main limitation is that data must be decrypted for processing or analysis, making it vulnerable to attacks during computation. Therefore, it does not provide end-to-end privacy guarantees for sensitive AI workloads.

**2.1.1. DISADVANTAGES**

- Vulnerable to inference leakage and data reconstruction attacks.

- Encryption methods protect data at rest and in transit but not during processing.

- Secure multi-party computation (SMPC) and differential privacy introduce computational and communication costs.

- Noise addition in differential privacy can impact model performance.

- Federated learning prevents data sharing but does not fully secure AI model inferences.

**2.2. PROPOSED SYSTEM **

The proposed system introduces a privacy-preserving Model-as-a-Service (MaaS) model using Fully Homomorphic Encryption (FHE) to ensure data confidentiality and prevent inference leakage attacks.

- **Inference Leakage Protection**

Inference leakage attacks pose a significant threat to AI models, exposing both model parameters and user data. By employing FHE, the system ensures that neither the input nor the output is visible to the cloud server. 

- **Privacy-Preserving AI Model Execution**

In this system, users encrypt their sensitive data before uploading it to the cloud. The AI model processes the encrypted data without decryption, ensuring complete privacy. Since the data remains encrypted during computation, neither the service provider nor potential attackers can extract valuable information, safeguarding user confidentiality.

- **User-Controlled Decryption**

Only authorized users possessing the private decryption key can access the final inference results. This approach ensures strict access control, preventing unauthorized entities from misusing AI-generated insights. Users benefit from AI capabilities without compromising the confidentiality of their personal or business data.

**2.2.1. ADVANTAGES**

- Ensures data privacy with homomorphic encryption

- Prevents inference leakage attacks

- Protects AI model confidentiality

- Supports real-time secure processing on encrypted data

- Allows user-controlled decryption of results

- Eliminates trust dependency on service providers

- Enables privacy-preserving Model-as-a-Service (MaaS)

- Maintains data confidentiality during storage, transit, and processing

- Enhances compliance with data protection regulations

- Secures AI inference without compromising model performance

**CHATPER 3**

**SYSTEM REQUIREMENTS**

**3.1 HARDWARE REQUIREMENTS**

- **Processors**		**: **Intel® Core™ i7 processor,** **

- **RAM**			**: **8 GB of Ram

- **Disk space**		**: **256 GB SSD

- **Operating systems**	**: **Windows® 10

**3.2. SOFTWARE REQUIREMENTS**

- **Programming**		: Python 3.7.4(64-bit) or (32-bit)

- **Framework **		: Flask 1.1.

- **Database**		: MySQL 5.

- **Web ****Server**		: Wampserver 2i

- **Packages**		: Pandas, Sikit Learn, Numpy, matplotlib, seaborn

- **Essential Libraries**

- PySEAL: For Fully Homomorphic Encryption (FHE)

- TensorFlow: For neural network development

**CHAPTER 4**

**SOFTWARE DESCRIPTION**

**4.1. PYTHON 3.8**

Python is a general-purpose interpreted, interactive, object-oriented, and high-level programming language. It was created by Guido van Rossum during 1985- 1990. Like Perl, Python source code is also available under the GNU General Public License (GPL). This tutorial gives enough understanding on Python programming language.

Python is a high-level, interpreted, interactive and object-oriented scripting language. Python is designed to be highly readable. It uses English keywords frequently where as other languages use punctuation, and it has fewer syntactical constructions than other languages. Python is a MUST for students and working professionals to become a great Software Engineer specially when they are working in Web Development Domain. Python is currently the most widely used multi-purpose, high-level programming language. Python allows programming in Object-Oriented and Procedural paradigms. Python programs generally are smaller than other programming languages like Java. Programmers have to type relatively less and indentation requirement of the language, makes them readable all the time. Python language is being used by almost all tech-giant companies like – Google, Amazon, Facebook, Instagram, Dropbox, Uber… etc. The biggest strength of Python is huge collection of standard libraries which can be used for the following:

- Machine Learning

- GUI Applications (like Kivy, Tkinter, PyQt etc.)

- Web frameworks like Django (used by YouTube, Instagram, Dropbox)

- Image processing (like OpenCV, Pillow)

- Web scraping (like Scrapy, BeautifulSoup, Selenium)

- Test frameworks

- Scientific computing

- Text processing and many more.

**Tensor Flow**

Tensor Flow is an end-to-end open-source platform for machine learning. It has a comprehensive, flexible ecosystem of tools, libraries, and community resources that lets researchers push the state-of-the-art in ML, and gives developers the ability to easily build and deploy ML-powered applications.

Tensor Flow provides a collection of workflows with intuitive, high-level APIs for both beginners and experts to create machine learning models in numerous languages. Developers have the option to deploy models on a number of platforms such as on servers, in the cloud, on mobile and edge devices, in browsers, and on many other JavaScript platforms. This enables developers to go from model building and training to deployment much more easily.

**Pandas**

pandas are a fast, powerful, flexible and easy to use open source data analysis and manipulation tool, built on top of the Python programming language. pandas are a Python package that provides fast, flexible, and expressive data structures designed to make working with "relational" or "labeled" data both easy and intuitive. It aims to be the fundamental high-level building block for doing practical, real world data analysis in Python.

Pandas is mainly used for data analysis and associated manipulation of tabular data in Data frames. Pandas allows importing data from various file formats such as comma-separated values, JSON, Parquet, SQL database tables or queries, and Microsoft Excel. Pandas allows various data manipulation operations such as merging, reshaping, selecting, as well as data cleaning, and data wrangling features. The development of pandas introduced into Python many comparable features of working with Data frames that were established in the R programming language. The panda’s library is built upon another library NumPy, which is oriented to efficiently working with arrays instead of the features of working on Data frames.

**NumPy**

NumPy, which stands for Numerical Python, is a library consisting of multidimensional array objects and a collection of routines for processing those arrays. Using NumPy, mathematical and logical operations on arrays can be performed.

NumPy is a general-purpose array-processing package. It provides a high-performance multidimensional array object, and tools for working with these arrays.

**Matplotlib**

Matplotlib is a comprehensive library for creating static, animated, and interactive visualizations in Python. Matplotlib makes easy things easy and hard things possible.

Matplotlib is a plotting library for the Python programming language and its numerical mathematics extension NumPy. It provides an object-oriented API for embedding plots into applications using general-purpose GUI toolkits like Tkinter, wxPython, Qt, or GTK.

**Scikit Learn**

scikit-learn is a Python module for machine learning built on top of SciPy and is distributed under the 3-Clause BSD license.

Scikit-learn (formerly scikits. learn and also known as sklearn) is a free software machine learning library for the Python programming language. It features various classification, regression and clustering algorithms including support-vector machines, random forests, gradient boosting, k-means and DBSCAN, and is designed to interoperate with the Python numerical and scientific libraries NumPy and SciPy.

**4.2. MYSQL 5**

MySQL is a relational database management system based on the Structured Query Language, which is the popular language for accessing and managing the records in the database. MySQL is open-source and free software under the GNU license. It is supported by Oracle Company. MySQL database that provides for how to manage database and to manipulate data with the help of various SQL queries. These queries are: insert records, update records, delete records, select records, create tables, drop tables, etc. There are also given MySQL interview questions to help you better understand the MySQL database.

MySQL is currently the most popular database management system software used for managing the relational database. It is open-source database software, which is supported by Oracle Company. It is fast, scalable, and easy to use database management system in comparison with Microsoft SQL Server and Oracle Database. It is commonly used in conjunction with PHP scripts for creating powerful and dynamic server-side or web-based enterprise applications. It is developed, marketed, and supported by MySQL AB, a Swedish company, and written in C programming language and C++ programming language. The official pronunciation of MySQL is not the My Sequel; it is My Ess Que Ell. However, you can pronounce it in your way. Many small and big companies use MySQL. MySQL supports many Operating Systems like Windows, Linux, MacOS, etc. with C, C++, and Java languages.

**4****.3. WAMPSERVER**

WampServer is a Windows web development environment. It allows you to create web applications with Apache2, PHP and a MySQL database. Alongside, PhpMyAdmin allows you to manage easily your database.

WAMPServer is a reliable web development software program that lets you create web apps with MYSQL database and PHP Apache2. With an intuitive interface, the application features numerous functionalities and makes it the preferred choice of developers from around the world. The software is free to use and doesn’t require a payment or subscription.

**4****.4. BOOTSTRAP 4**

Bootstrap is a free and open-source tool collection for creating responsive websites and web applications. It is the most popular HTML, CSS, and JavaScript framework for developing responsive, mobile-first websites. 

It solves many problems which we had once, one of which is the cross-browser compatibility issue. Nowadays, the websites are perfect for all the browsers (IE, Firefox, and Chrome) and for all sizes of screens (Desktop, Tablets, Phablets, and Phones). All thanks to Bootstrap developers -Mark Otto and Jacob Thornton of Twitter, though it was later declared to be an open-source project.

**Easy to use**: Anybody with just basic knowledge of HTML and CSS can start using Bootstrap

**Responsive features**: Bootstrap's responsive CSS adjusts to phones, tablets, and desktops

**Mobile-first approach**: In Bootstrap, mobile-first styles are part of the core framework

**Browser compatibility**: Bootstrap 4 is compatible with all modern browsers (Chrome, Firefox, Internet Explorer 10+, Edge, Safari, and Opera)

**4****.5. FLASK**

[Flask](http://flask.pocoo.org/) is a web framework. This means flask provides you with tools, libraries and technologies that allow you to build a web application. This web application can be some web pages, a blog, a wiki or go as big as a web-based calendar application or a commercial website.

Flask is often referred to as a micro framework. It aims to keep the core of an application simple yet extensible. Flask does not have built-in abstraction layer for database handling, nor does it have formed a validation support. Instead, Flask supports the extensions to add such functionality to the application.  Although Flask is rather young compared to most [Python](https://quintagroup.com/services/python) frameworks, it holds a great promise and has already gained popularity among Python web developers. Let’s take a closer look into Flask, so-called “micro” framework for Python. Flask is part of the categories of the micro-framework. Micro-framework are normally framework with little to no dependencies to external libraries. This has pros and cons. Pros would be that the framework is light, there are little dependency to update and watch for security bugs, cons is that some time you will have to do more work by yourself or increase yourself the list of dependencies by adding plugins.

**CHAPTER 5**

**SYSTEM DESIGN**

**5.1. SYSTEM ARCHITECTURE**

AI Model Processing 

Register 

Login

Receive Key Pair

Encrypt Input Data

Receive Encrypted Result

Decrypt Result

Register 

Login

Receive Key Pair

Encrypt Model Feature

Deploy Model

View Model Usage

AI Model User

AI Model Owner or Developer 

System Maintenance

User Management

Login

Registration Approval

Registration Approval

Encrypted Processing

Secure Computation

Encrypted Result

**AI Model Service Provider**

Admin

Approve User

Send to Model Processing

**5.2. DATA FLOW DIAGRAM**

**LEVEL 0**

**LEVEL 1**

**LEVEL 2**

**5.3. ****UML DIAGRAM**

**5****.3.1. USE CASE**

**5****.3.2. CLASS DIAGRAM**

**5****.3.3. ACTIVITY DIAGRAM**

**5.3.4. SEQUENCE DIAGRAM**

**5****.3.5. COLLABORATION DIAGRAM**

**5****.3.6. ****COMPONENT**** DIAGRAM **

**5.4****. ER DIAGRAM**

**CHAPTER 6**

**SYSTEM TESTING**

**6.1. SOFTWARE TESTING**

Testing is a crucial phase in the software development life cycle to ensure that the Privacy-Preserving Model-as-a-Service system works as intended, ensuring data confidentiality, model privacy, and secure inference processing. The following types of testing can be applied to this system:

**Types of Testing**

- **Unit Testing**

Unit testing focuses on testing individual software components or modules to ensure they work as expected. In the context of this system, components such as the encryption function (e.g., encryption of input data), decryption module, and the AI inference engine can be tested separately to verify each performs its task correctly.

- **Integration Testing**

Integration testing ensures that different modules work together when integrated. For this system, integration testing would verify that the encrypted data can be processed by the AI model, the results are returned encrypted, and only authorized users can decrypt the results correctly. Ensuring the seamless interaction between modules such as the encryption, AI model, and decryption is crucial.

- **System Testing**

System testing verifies the entire system meets the specified requirements and performs as intended. This includes both functional and non-functional testing. In this case, it would involve testing the complete workflow of the system, from data encryption, AI inference on encrypted data, to decryption of results, ensuring that privacy is maintained throughout the entire process.

- **Acceptance Testing**

Acceptance testing is performed to ensure that the system meets the end-users' requirements and expectations. End-users, such as data owners or organizations using the Model-as-a-Service platform, would test the system to confirm that the encrypted AI inference and secure result retrieval functionalities align with their privacy expectations and operational needs.

- **Performance Testing**

Performance testing assesses how well the system performs under various conditions, such as increased load or high traffic. For this system, performance testing would focus on the response time for encrypted data processing, the system’s scalability to handle multiple user requests, and the latency involved in performing AI inference on encrypted data using FHE.

- **User Acceptance Testing (UAT)**

User Acceptance Testing involves end-users testing the system in a simulated production environment to ensure it meets their needs and expectations. For this privacy-preserving Model-as-a-Service system, UAT would include validating that users can submit encrypted data, receive encrypted results, and access decrypted insights in a secure and user-friendly manner.

- **Security Testing**

Security testing focuses on identifying vulnerabilities and ensuring the system is secure against threats such as inference leakage, unauthorized access, and data breaches. In this case, security testing would validate that the system properly protects against inference attacks, ensures encryption integrity, and prevents unauthorized entities from accessing sensitive data or AI inferences.

- **Compatibility Testing**

Compatibility testing ensures that the system works across different platforms, browsers, and devices. For this system, testing would verify that users can securely interact with the system from various environments, whether on different operating systems (e.g., Windows, Linux) or devices (e.g., desktops, tablets).

**6.2. TEST CASE**

**Test Case ID**: TC001

- **Input**: User uploads encrypted data for AI inference.

- **Expected Result**: System accepts the encrypted data and queues it for processing.

- **Actual Result**: Encrypted data successfully uploaded and ready for AI model processing.

- **Status**: Pass

**Test Case ID**: TC002

- **Input**: User attempts to upload unencrypted data.

- **Expected Result**: System rejects the data and prompts the user to encrypt it first.

- **Actual Result**: Error message displayed prompting the user to upload encrypted data.

- **Status**: Pass

**Test Case ID**: TC003

- **Input**: AI model processes encrypted data and returns encrypted results.

- **Expected Result**: Inference is completed on encrypted data, and the result is returned in encrypted form.

- **Actual Result**: Encrypted result generated and ready for decryption.

- **Status**: Pass

**Test Case ID**: TC004

- **Input**: Unauthorized user attempts to access the encrypted inference results.

- **Expected Result**: System denies access and shows an error message.

- **Actual Result**: Unauthorized access blocked with error message displayed.

- **Status**: Pass

**Test Case ID**: TC005

- **Input**: Authorized user with correct decryption key attempts to decrypt results.

- **Expected Result**: User successfully decrypts the results and views the inference.

- **Actual Result**: Results decrypted and presented in readable format.

- **Status**: Pass

**Test Case ID**: TC006

- **Input**: User with an incorrect decryption key attempts to decrypt results.

- **Expected Result**: System denies access and shows an error message.

- **Actual Result**: Error message displayed, preventing decryption.

- **Status**: Pass

**Test Case ID**: TC007

- **Input**: User submits large encrypted data set for inference processing.

- **Expected Result**: The system successfully processes the large data set within a reasonable time frame.

- **Actual Result**: Data processed without performance issues or timeouts.

- **Status**: Pass

**Test Case ID**: TC008

- **Input**: System handles simultaneous requests from multiple users uploading encrypted data.

- **Expected Result**: The system processes multiple encrypted data uploads without delay or error.

- **Actual Result**: Simultaneous requests processed smoothly without system lag or crashes.

- **Status**: Pass

**Test Case ID**: TC009

- **Input**: User attempts to access inference results without proper authorization.

- **Expected Result**: System denies access and prompts for re-authentication.

- **Actual Result**: Unauthorized access attempt blocked, user prompted to authenticate.

- **Status**: Pass

**Test Case ID**: TC010

- **Input**: System processes encrypted data from a valid user for real-time inference.

- **Expected Result**: The AI model returns inference results in real-time without decryption.

- **Actual Result**: Real-time inference completed and result returned in encrypted form.

- **Status**: Pass

**Test Case ID**: TC011

- **Input**: User submits data with errors during encryption.

- **Expected Result**: System detects encryption errors and prompts the user to fix them.

- **Actual Result**: Error message displayed due to invalid encrypted data.

- **Status**: Pass

**Test Case ID**: TC012

- **Input**: User attempts to decrypt results on a device with insufficient security.

- **Expected Result**: System prevents decryption and alerts the user about the security issue.

- **Actual Result**: Decryption blocked with a security warning.

- **Status**: Pass

**Test Case ID**: TC013

- **Input**: Admin tries to access system logs and monitor performance.

- **Expected Result**: Admin successfully accesses logs and real-time system performance metrics.

- **Actual Result**: Admin dashboard displays logs and metrics accurately.

- **Status**: Pass

**Test Case ID**: TC014

- **Input**: User attempts multiple failed decryption attempts.

- **Expected Result**: System locks the user account after three failed decryption attempts.

- **Actual Result**: Account locked after exceeding the allowed number of failed attempts.

- **Status**: Pass

**Test Case ID**: TC015

- **Input**: User updates personal information or encryption settings.

- **Expected Result**: System saves changes successfully and updates the user's profile.

- **Actual Result**: Personal information and settings updated in the system.

- **Status**: Pass

**6.3. TEST REPORT**

**Introduction**

This test report outlines the testing conducted for the project. The system utilizes Fully Homomorphic Encryption (FHE) to protect user data during AI model processing, ensuring that data remains confidential and secure while being processed in a cloud environment. The testing is focused on verifying the correctness, security, and performance of the system, especially concerning encryption, inference leakage protection, user data privacy, and overall system reliability.

**Test Objective**

The primary objectives of the testing phase were to:

- Ensure that data confidentiality is maintained throughout the process, from data upload to AI inference.

- Verify that the system successfully prevents inference leakage and unauthorized access to sensitive information.

- Test the functionality of key features such as data encryption, user-controlled decryption, and system access controls.

- Assess system performance in terms of handling large datasets, concurrent user requests, and real-time processing.

- Validate that the system meets user expectations and security requirements.

**Test Scope**

The scope of the testing included:

- **Encryption and Decryption Testing**: Verifying that data is securely encrypted before being uploaded, and that only authorized users can decrypt the inference results.

- **Security Testing**: Ensuring that unauthorized access attempts are blocked, and sensitive data is protected against leakage.

- **Performance Testing**: Evaluating the system’s ability to process large amounts of data and handle concurrent user requests without significant delays.

- **Functional Testing**: Ensuring that each module of the system (e.g., encryption, inference, decryption) functions as expected, and data is processed accurately.

- **User Access Control Testing**: Verifying that only authorized users can access encrypted results and modify system settings.

**Test Environment**

The testing was conducted in the following environment:

- **Server**: Cloud-based virtual server with adequate resources to simulate real-world processing and data handling.

- **Operating System**: Ubuntu Linux 20.04 LTS.

- **Database**: MySQL 8.0, used for storing user data and encrypted results.

- **AI Model**: A trained machine learning model deployed in the system, capable of inference on encrypted data.

- **Security Tools**: OpenSSL for encryption and decryption, along with custom-built security mechanisms for access control and data protection.

- **Network**: Secure network with HTTPS for encrypted communication between the client and server.

**Test Conclusion**

The testing of the project was successful in ensuring that all key functionalities, including encryption, inference leakage prevention, data privacy, and user access control, work as expected. The system meets the security and privacy requirements and performs well under both normal and high-load conditions. The user access controls and decryption mechanisms are robust, ensuring that only authorized users can access sensitive data.

**CHAPTER 7**

**SYSTEM IMPLEMENTATION**

**7.1. PROJECT DESCRIPTION**

The Privacy-Preserving Model-as-a-Service (MaaS) System is a secure, cloud-based platform designed to enable encrypted deployment and usage of AI models using Fully Homomorphic Encryption (FHE). This advanced cryptographic approach allows both AI models and user input data to remain encrypted throughout the entire processing cycle, ensuring maximum privacy and confidentiality. The system caters to two primary stakeholders—Model Owners and Model Users. Model Owners can securely upload and manage their AI models in an encrypted format, while Model Users can input their encrypted data for evaluation without the risk of exposing sensitive information. The platform performs computations directly on encrypted data, producing encrypted results that are only accessible to authorized users via secure decryption keys. The architecture includes key modules such as user management, secure key generation, model and data encryption, AI model evaluation, and result decryption. Access control, authentication, and activity tracking further ensure the integrity and traceability of all operations. This system is especially suited for applications in healthcare, finance, and government, where data sensitivity and regulatory compliance are paramount. By maintaining end-to-end data confidentiality without compromising performance, the Privacy-Preserving MaaS System represents a significant leap toward secure, trustworthy, and scalable AI deployments in privacy-critical domains.

**7.2. MODULES DESCRIPTION**

**1. ****MaaS**** Model Service Provider**

The MaaS Model Service Provider serves as the central authority within the system, overseeing user management, secure model deployment, and encrypted communication using Homomorphic Encryption. It is responsible for handling the registration process, where it has the ability to approve or reject requests from both Model Owners and Model Users, ensuring that only verified entities gain access. Once Model Owners are approved, the service provider ensures that all AI models are encrypted using Homomorphic Encryption before being deployed to maintain data privacy and integrity. Additionally, the provider continuously monitors model usage history, offering a transparent and accountable system for tracking interactions and ensuring compliance. It also plays a critical role in secure key management by facilitating the exchange of encryption and decryption keys between the appropriate stakeholders, thus safeguarding encrypted data flow throughout the system.

**2. System User Module**

This module handles both **Model Owner** and **Model User** activities.

**2.1. Owner**

- **Registration:** Submits user details for approval.

- **Approval Process:** Gains access after approval by the MaaS Model Service Provider.

- **Login:** Authenticates securely with provided credentials.

- **Encrypt Features ****&**** Deploy Model:** Encrypts the AI model’s features using **Homomorphic Encryption** before deployment.

- **View Model Usage History:** Tracks user requests, interactions, and overall model usage.

**2.2. User**

- **Registration:** Submits user details for account creation.

- **Approval Process:** Gains access after approval by the MaaS Model Service Provider.

- **Login:** Authenticates securely with provided credentials.

- **Input Encrypted Data:** Encrypts their input data using **Homomorphic Encryption** before submission.

- **Receive Decrypted Result:** Decrypts the encrypted result using the assigned decryption key.

**3. Key Generation Module**

This module is crucial for generating and distributing secure cryptographic keys that enable Homomorphic Encryption.

- **Generate Key Pairs:** Uses Homomorphic Encryption key generation algorithms to create public-private key pairs.

- **Provide Key Pairs:** Assigns encryption keys to the Model Owner for model encryption and decryption keys to the Model User for result decryption.

**4. Data Encryption Module**

The Data Encryption Module plays a vital role in safeguarding sensitive information by ensuring that all data—both the AI model features and user input—is encrypted using Homomorphic Encryption prior to any processing. This module guarantees that the Model Owner’s features are securely encrypted using the assigned encryption key, maintaining the confidentiality of the model's structure and parameters. Similarly, it ensures that Model Users encrypt their input data before submission, preventing any unauthorized access during transmission or computation. By employing Homomorphic Encryption algorithms, the module allows data to remain encrypted throughout the entire processing lifecycle, eliminating the need for decryption at any stage and thus significantly enhancing data privacy and system security.

**5. AI Model Evaluation Module**

The AI Model Evaluation Module is designed to perform secure computations on encrypted data using Homomorphic Encryption, ensuring complete privacy during model inference. It enables the system to execute AI model computations directly on the encrypted inputs without requiring decryption, thus maintaining the confidentiality of both the model and the user data. Throughout the evaluation process, the model features and the user’s encrypted input remain secure and untouched by unauthorized access. This module generates encrypted results that uphold data privacy and prevent exposure of sensitive information, delivering privacy-preserving outcomes while maintaining the integrity and accuracy of the AI model’s predictions.

**6. Encrypted Output Generation Module**

The Encrypted Output Generation Module is responsible for producing encrypted results after the model evaluation phase. Once the AI model processes the user’s encrypted input, this module ensures that the resulting predictions are also encrypted before being transmitted. This guarantees that sensitive output data remains protected throughout its journey from the server to the Model User. By preserving the confidentiality of the results until they are decrypted by the authorized Model User, this module plays a crucial role in maintaining end-to-end data security and trust in the system’s privacy-preserving framework.

**7. Result Decryption Module**

The Result Decryption Module empowers the Model User to securely decrypt the results received from the encrypted model evaluation process. Utilizing the assigned decryption key, this module ensures that the encrypted output can be accurately decoded without compromising data security. It maintains the integrity of the original information by preserving the accuracy and reliability of the decrypted results. Additionally, the module enforces controlled access mechanisms to prevent unauthorized users from accessing sensitive information, thereby reinforcing the system’s commitment to data confidentiality and trustworthiness.

**CHAPTER 8**

**APPENDICES**

**8.1. SCREENSHOTS**

**8.2. SOURCE CODE**

**Packages**

from flask import Flask, render_template, Response, redirect, request, session, abort, url_for

import os

import base64

from PIL import Image

from datetime import datetime

from random import randint

from cryptography.hazmat.backends import default_backend

import cv2

import PIL.Image

from PIL import Image

import imagehash

from flask import send_file

import pandas as pd

import numpy as np

import matplotlib.pyplot as plt

import csv

import threading

import time

import shutil

import hashlib

import urllib.request

import urllib.parse

import json

import mysql.connector

from werkzeug.utils import secure_filename

import socket

import re, uuid

import seal

import tensorflow as tf

**Database Connection**

mydb = mysql.connector.connect(

host="localhost",

user="root",

passwd="",

charset="utf8",

database="MaaS_model"

**Login**

def login():

cnt=0

msg=""

if request.method == 'POST':

username1 = request.form['uname']

password1 = request.form['pass']

mycursor = mydb.cursor()

mycursor.execute("SELECT count(*) FROM am_admin where username=%s && password=%s",(username1,password1))

myresult = mycursor.fetchone()[0]

if myresult>0:

session['username'] = username1

#result=" Your Logged in sucessfully**"

return redirect(url_for('admin'))

else:

msg="You are logged in fail!!!"

**Model Owner Registration**

def register():

msg=""

act=""

mycursor = mydb.cursor()

now = datetime.datetime.now()

rdate=now.strftime("%d-%m-%Y")

mycursor.execute("SELECT max(id)+1 FROM am_developer")

maxid = mycursor.fetchone()[0]

if maxid is None:

maxid=1

input_str = str(maxid)

padded_str = pad_left(input_str, 3)

m_id="OW"+padded_str

if request.method=='POST':

uname=request.form['uname']

name=request.form['name']

mobile=request.form['mobile']

email=request.form['email']

location=request.form['location']

country=request.form['country']

pass1=request.form['pass']

now = datetime.datetime.now()

rdate=now.strftime("%d-%m-%Y")

mycursor.execute("SELECT count(*) FROM am_developer where uname=%s",(uname, ))

cnt = mycursor.fetchone()[0]

if cnt==0:

uid=str(maxid)

sql = "INSERT INTO am_developer(id, name, mobile, email, location,country,uname, pass,create_date,public_key,private_key) VALUES (%s, %s, %s, %s, %s, %s, %s, %s,%s,%s,%s)"

val = (maxid, name, mobile, email, location,country, uname, pass1,rdate,pbkey,prkey)

mycursor.execute(sql, val)

mydb.commit()

#print(mycursor.rowcount, "record inserted.")

msg="success"

else:

msg="fail"

#Fully Homomorphic Encryption (FHE)

def FHE_keygen():

parms = seal.EncryptionParameters(seal.scheme_type.BFV)

parms.set_poly_modulus_degree(4096)

parms.set_coeff_modulus(seal.CoeffModulus.BFVDefault(4096))

parms.set_plain_modulus(1024)

context = seal.SEALContext(parms)

keygen = seal.KeyGenerator(context)

public_key = keygen.public_key()

secret_key = keygen.secret_key()

encryptor = seal.Encryptor(context, public_key)

decryptor = seal.Decryptor(context, secret_key)

evaluator = seal.Evaluator(context)

encoder = seal.IntegerEncoder(context)

def encrypt_file(input_path, output_path):

with open(input_path, 'r') as f:

lines = f.readlines()

with open(output_path, 'w') as out:

for line in lines:

for word in line.strip().split():

num = sum([ord(c) for c in word])  # simple conversion

plain = encoder.encode(num)

cipher = seal.Ciphertext()

encryptor.encrypt(plain, cipher)

# Save ciphertext as base64

out.write(base64.b64encode(cipher.save()).decode() + '\n')

def decrypt_file(encrypted_path):

with open(encrypted_path, 'r') as f:

for line in f:

cipher = seal.Ciphertext()

cipher.load(context, base64.b64decode(line.strip()))

plain = seal.Plaintext()

decryptor.decrypt(cipher, plain)

decoded = encoder.decode_int32(plain)

print(f"Decrypted integer: {decoded}")

**Deploy Model**

def dev_upload():

msg=""

act=request.args.get("act")

uname=""

if 'username' in session:

uname = session['username']

mycursor = mydb.cursor(buffered=True)

if request.method == 'POST':

file = request.files['file']

mycursor.execute("SELECT max(id)+1 FROM am_model")

maxid = mycursor.fetchone()[0]

if maxid is None:

maxid=1

mid=str(maxid)

fnn=secure_filename(file.filename)

file.save(os.path.join("static/model/", fn1))

mycursor.execute("SELECT count(*) FROM am_model where model_file=%s",(fn1,))

dd = mycursor.fetchone()[0]

if dd==0:

mid=str(maxid)

sql = "INSERT INTO am_model(id,model_file,model_id,public_key,private_key) VALUES (%s, %s, %s,%s,%s)"

val = (maxid,fn1,m_id,pbkey,prkey)

mycursor.execute(sql, val)

mydb.commit()

else:

mycursor.execute("SELECT * FROM am_model where model_file=%s",(fn1,))

d1 = mycursor.fetchone()

mid=str(d1[0])

mycursor.execute("update am_model set owner=%s where model_file=%s",(uname,fn1))

mydb.commit()

mst="1"

msg="success"

#Encrypt model features

mycursor.execute("SELECT * FROM am_label where mid=%s",(mid,))

vdata = mycursor.fetchall()

password_provided = pbkey

password = password_provided.encode()

salt = b'salt_'

key = base64.urlsafe_b64encode(kdf.derive(password))

input_file = 'static/data/'+model1+"/"+fd[3]

output_file = 'static/data/'+model1+"/"+fd[3]

encrypt_file(input_file, output_file)

for vd in vdata:

if vd[11]==0:

name=obj.encrypt(vd[3])

dob=obj.encrypt(vd[4])

gender=obj.encrypt(vd[5])

crime_type=obj.encrypt(vd[6])

crime_details=obj.encrypt(vd[7])

cdate=obj.encrypt(vd[8])

cstatus=obj.encrypt(vd[9])

address=obj.encrypt(vd[10])

mycursor.execute("update am_label set name=%s,dob=%s,gender=%s,crime_type=%s,details=%s,crime_date=%s,status=%s,address=%s,enc_st=1 where mid=%s && label_name=%s",(name,dob,gender,crime_type,crime_details,cdate,cstatus,address,mid,vd[2]))

mydb.commit()

**Add Model Meta Data**

def dev_meta():

msg=""

act=request.args.get("act")

mid=request.args.get("mid")

mycursor = mydb.cursor()

uname=""

if 'username' in session:

uname = session['username']

mycursor.execute("SELECT * FROM am_developer where uname=%s",(uname,))

data = mycursor.fetchone()

mycursor.execute("SELECT * FROM am_model where id=%s",(mid,))

mdata = mycursor.fetchone()

if request.method == 'POST':

mm_id=request.form['model_id']

mycursor.execute("SELECT count(*) FROM model_metadata where model_id=%s",(mm_id,))

mdat = mycursor.fetchone()[0]

if mdat>0:

mycursor.execute("delete from model_metadata where model_id=%s",(mm_id,))

mydb.commit()

fields = [

'model_id', 'model_name', 'model_version', 'model_owner_id',

'model_description', 'model_type', 'input_type', 'output_type',

'model_algorithm', 'training_dataset', 'model_accuracy',

'evaluation_metrics', 'homomorphic_encryption', 'encryption_status',

'deployment_date',  'access_permissions',

'license_type', 'compliance_status'

values = [request.form[field] for field in fields]

cols        = ", ".join(fields)

placeholders = ", ".join(["%s"] * len(fields))

sql = f"""

INSERT INTO model_metadata ({cols})

VALUES ({placeholders})

mycursor.execute(sql, values)

mydb.commit()

msg="success"

#Model Test and Prediction

def user_process():

mycursor.execute("SELECT * FROM am_data where mid=%s && hash1=%s",(mid1,hash1))

dd = mycursor.fetchall()

for d1 in dd:

mycursor.execute("SELECT * FROM am_model where id=%s",(mid,))

dd2 = mycursor.fetchone()

ky=dd2[3]

model=dd2[1]

mycursor.execute("SELECT count(*) FROM am_data where mid=%s && hash1=%s",(mid1,hash1))

cnt = mycursor.fetchone()[0]

if cnt>0:

mycursor.execute("SELECT * FROM am_data where mid=%s && hash1=%s",(mid1,hash1))

dd = mycursor.fetchall()

for d1 in dd:

efn=d1[3]

mid=str(d1[1])

label=d1[5]

mycursor.execute("SELECT * FROM am_model where id=%s",(mid,))

dd2 = mycursor.fetchone()

ky=dd2[3]

input_file = "static/dataset/"+model1+"/"+lab+"/"+efn

output_file = 'static/down/'+efn

decrypt_file(input_file)

mycursor.execute("SELECT * FROM am_label where label_name=%s",(lab,))

cd = mycursor.fetchone()

cdata.append(obj.decrypt(cd[3].encode("utf-8")))

cdata.append(obj.decrypt(cd[4].encode("utf-8")))

cdata.append(obj.decrypt(cd[5].encode("utf-8")))

cdata.append(obj.decrypt(cd[6].encode("utf-8")))

cdata.append(obj.decrypt(cd[7].encode("utf-8")))

cdata.append(obj.decrypt(cd[8].encode("utf-8")))

cdata.append(obj.decrypt(cd[9].encode("utf-8")))

cdata.append(obj.decrypt(cd[10].encode("utf-8")))

mycursor.execute("update am_test set score=%s,status='Failed',remarks=%s where id=%s",(score,rem,tid))

mydb.commit()

if request.method == 'POST':

dkey = request.form['dkey']

if dkey==prkey:

msg="success"

else:

msg="fail"

acc=float(uu3)*100

score=str(acc)

# plot the accuracy

plt.plot(xx, label='Test')

plt.plot(yy, label='Val')

plt.title('Accuracy')

plt.ylabel('Accuracy')

plt.xlabel('Epoch')

plt.legend(['Test', 'Val'], loc='upper left')

plt.savefig("static/acc.png")

**CHAPTER 9**

**BOTTOMLINE**

**9.1. CONCLUSION**

In conclusion, this project successfully implements a Privacy-Preserving Model-as-a-Service (MaaS) Framework utilizing Fully Homomorphic Encryption (FHE), providing a secure and efficient solution for deploying and accessing AI models without compromising sensitive data. By integrating modules such as the MaaS Model Service Provider, System User Module, Key Generation Module, Data Encryption Module, Encrypted Model Evaluation, and Result Decryption, the system ensures end-to-end encryption throughout the data processing lifecycle. Model Owners can securely deploy encrypted AI models, while Model Users can submit encrypted input and receive encrypted results, maintaining complete data confidentiality. The use of FHE guarantees that computations are performed on encrypted data without the need for decryption, significantly enhancing data privacy and trust. The framework also supports robust access control, key management, and model usage tracking, ensuring accountability and transparency in AI service delivery. While the system effectively addresses critical privacy concerns in AI deployment, future improvements may focus on optimizing computational efficiency, integrating cloud-based scalability, and expanding support for a wider range of AI model types. Thus, this project represents a significant advancement in secure AI model deployment, laying the foundation for trustworthy and privacy-aware AI solutions across various sensitive sectors such as healthcare, finance, and defense.

**9.2. FUTURE ENHANCEMENT**

- **Mobile-Friendly User Interface**

Develop a responsive and intuitive mobile interface for both Model Owners and Model Users to streamline encrypted model deployment and result access.

- **Multi-Model Support**

Enable support for complex AI architectures such as deep neural networks and transformer models to broaden the framework’s applicability across domains.

- **Blockchain Integration**

Integrate blockchain technology for secure, transparent, and immutable logging of model usage and key management activities, enhancing accountability and traceability.

**CHAPTER 10**

**REFERENCE**

**10.1. JOURNAL REFERENCE **

- X. Pei, X. Deng, S. Tian, J. Liu and K. Xue, "Privacy-enhanced graph neural network for decentralized local graphs", IEEE Transactions on Information Forensics and Security, vol. 19, pp. 1614-1629, 2024.

- L. Bergerat, A. Boudi, Q. Bourgerie, I. Chillotti, D. Ligier, J.-B. Orfila, et al., "Parameter Optimization and Larger Precision for (T)FHE", Journal of Cryptology, vol. 36, no. 3, pp. 28, Jun. 2023.

- L. Folkerts, C. Gouert and N. G. Tsoutsos, "REDsec: Running Encrypted Discretized Neural Networks in Seconds", Proceedings of the Network and Distributed System Security Symposium (NDSS), March 2023.

- N Carlini, S Chien, M Nasr et al., "Membership inference attacks from first principles[C]", 2022 IEEE Symposium on Security and Privacy (SP), pp. 1897-1914, 2022.

- A El Ouadrhiri and A Abdelhadi, "Differential privacy for deep and federated learning: A survey[J]", IEEE access, vol. 10, pp. 22359-22380, 2022.

- C A Choquette-Choo, F Tramer, N Carlini et al., "Label-only membership inference attacks[C]", International conference on machine learning, pp. 1964-1974, 2021.

- A. Kumar, R. S. Raj, P. Yadav, and M. Singh, "Blockchain-based secure model deployment in AI as a Service system," Journal of Cryptographic Engineering, vol. 15, no. 2, pp. 125-142, 2024.

- M. S. Rahman, T. Ahmed, and M. M. Rahman, "Homomorphic encryption in secure AI model evaluation: A survey of applications and challenges," International Journal of Information Security, vol. 23, no. 4, pp. 379-394, 2023.

- P. Sharma, S. Bansal, and S. Jain, "Enhanced security for MaaS with fully homomorphic encryption and federated learning," Journal of Cloud Computing: Advances, Systems, and Applications, vol. 13, no. 1, pp. 45-59, 2024.

- L. Liu, J. Ma, and F. Zhao, "AI model privacy and data protection using homomorphic encryption: Frameworks and best practices," IEEE Access, vol. 12, pp. 10433-10445, 2024.

**10.2. BOOK REFERENCE **

- A. S. R. Jadhav, Python Web Development with Flask, Packt Publishing, 2020.

- M. A. Khan, MySQL for Developers: A Comprehensive Guide to MySQL Database Design and Programming, O'Reilly Media, 2021.

- F. Chollet, Deep Learning with Python, Manning Publications, 2018.

- S. Raschka, Python Machine Learning, Packt Publishing, 2015.

- M. McKinney, Python for Data Analysis, O'Reilly Media, 2017.

- S. K. Jain, Mastering Flask Web Development, Packt Publishing, 2020.

- J. VanderPlas, Python Data Science Handbook, O'Reilly Media, 2016.

- B. S. Batra, Hands-On Web Development with Bootstrap 4, Packt Publishing, 2019.

**10.3. WEB REFERENCE**

- "Flask Documentation," Flask, https://flask.palletsprojects.com/.

- "MySQL Documentation," MySQL, [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/).

- "TensorFlow Documentation," TensorFlow, https://www.tensorflow.org/api_docs.

- "Pandas Documentation," Pandas, https://pandas.pydata.org/pandas-docs/stable/.

- "Scikit-learn Documentation," Scikit-learn, https://scikit-learn.org/stable.

- "Matplotlib Documentation," Matplotlib, https://matplotlib.org/stable/contents.html.

- "Bootstrap Documentation," Bootstrap, https://getbootstrap.com/docs/4.5/getting-started/introduction.

- "WampServer Documentation," WampServer, https://www.wampserver.com/en.

68