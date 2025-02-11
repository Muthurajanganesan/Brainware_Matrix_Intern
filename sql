CREATE TABLE Users (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Role ENUM('Admin', 'Librarian', 'Student', 'Faculty') NOT NULL
);

CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Category_ID INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Copies_Available INT DEFAULT 1,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);

CREATE TABLE Borrowing (
    Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Book_ID INT,
    Issue_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Return_Date DATE,
    Fine DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

CREATE TABLE Reservations (
    Reservation_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Book_ID INT,
    Reservation_Date DATE NOT NULL,
    Status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

CREATE TABLE Fines (
    Fine_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Amount DECIMAL(5,2) NOT NULL,
    Status ENUM('Pending', 'Paid') DEFAULT 'Pending',
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);
