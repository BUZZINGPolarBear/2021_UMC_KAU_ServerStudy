-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hmZKqg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `User` (
    `userIdx` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(30)  NOT NULL ,
    `email` varchar(30)  NOT NULL ,
    `mannerTemperature` int  NOT NULL ,
    `sellingProduct` varchar(30)  NULL ,
    `profileImgUrl` text  NULL ,
    `tagInfo` varchar(10)  NOT NULL ,
    `status` varchar(10)  NOT NULL DEFAULT 'active',
    `createAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `updateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `userIdx`
    )
);

CREATE TABLE `Town` (
    `townIdx` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(30)  NOT NULL ,
    `adjacentInfo` varchar(30)  NOT NULL ,
    `status` varchar(10)  NOT NULL DEFAULT 'active',
    `createAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `updateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `townIdx`
    )
);

CREATE TABLE `Room` (
    `roomIdx` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(20)  NOT NULL ,
    `imgUrl` text  NOT NULL ,
    `status` varchar(10)  NOT NULL DEFAULT 'active',
    `createAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `updateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `roomIdx`
    )
);

CREATE TABLE `Chat` (
    `chatIdx` int AUTO_INCREMENT NOT NULL ,
    `roomIdx` int  NOT NULL ,
    `message` text  NOT NULL ,
    `status` varchar(10)  NOT NULL DEFAULT 'active',
    `createAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `updateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `chatIdx`
    )
);

CREATE TABLE `Product` (
    `productIdx` int AUTO_INCREMENT NOT NULL ,
    `name` char(50)  NOT NULL ,
    `productInfo` text  NOT NULL ,
    `price` int ,
    `sellerIdx` int AUTO_INCREMENT NOT NULL ,
    `status` varchar(10)  NOT NULL DEFAULT 'active',
    `createAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `updateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `productIdx`,`sellerIdx`
    )
);

ALTER TABLE `Room` ADD CONSTRAINT `fk_Room_imgUrl` FOREIGN KEY(`imgUrl`)
REFERENCES `User` (`profileImgUrl`);

ALTER TABLE `Chat` ADD CONSTRAINT `fk_Chat_roomIdx` FOREIGN KEY(`roomIdx`)
REFERENCES `Room` (`roomIdx`);

ALTER TABLE `Product` ADD CONSTRAINT `fk_Product_sellerIdx` FOREIGN KEY(`sellerIdx`)
REFERENCES `User` (`userIdx`);

INSERT INTO User VALUES(1, )
