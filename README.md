# 💰 VHDL Money Management System 🎟️

A digital system implemented in VHDL for handling monetary transactions, designed for applications like vending machines or ticket dispensing systems.

## 🔍 Overview

This project implements a complete money management system in VHDL that can:
- Process payments and calculate change
- Track available currency denominations
- Display amounts on 7-segment displays
- Handle ticket dispensing operations
- Support both user and administrator modes

## 🧩 Components

The system consists of several interconnected modules:

### 💾 `memory_money`
- Stores and manages available currency denominations
- Supports admin mode for inventory management
- Handles withdrawal of money when dispensing change
- Provides error signals when insufficient funds are available

### 🧮 `calculate_cost`
- Determines the cost of requested items
- Performs validation to ensure the cost doesn't exceed system limits
- Outputs error signals for invalid inputs

### 🔢 `segment_7`
- Converts 4-bit binary values to 7-segment display patterns
- Used for visual feedback on the system's displays

### 🔄 `number_splitter`
- Breaks down numbers into units, tens, and hundreds
- Enables multi-digit display on 7-segment indicators

### 💵 `introduce_money`
- Handles currency input from users
- Tracks accumulated payment
- Signals when sufficient funds have been provided

### ⚖️ `calculate_rest`
- Determines the amount of change needed
- Compares input amount against required cost
- Outputs error signals when appropriate

### 🪙 `procesare_rest`
- Calculates optimal denomination mix for change
- Uses a greedy algorithm to minimize number of coins/bills
- Breaks down change into available denominations (1, 2, 5, 10, 20, 50)

### 🎫 `memory_tickets`
- Manages ticket inventory
- Decrements available tickets when purchases are made
- Provides error signals when ticket stock is depleted

## 🚀 Features

- **Dual Mode Operation**: Supports both user and administrative interfaces
- **Denomination Tracking**: Maintains count of all currency denominations
- **Change Optimization**: Calculates optimal change using available denominations
- **Error Handling**: Comprehensive error detection for insufficient funds or inventory
- **Display Support**: Interfaces with 7-segment displays for user feedback
- **Resource Efficient**: Designed with minimal hardware resource usage

## 🔌 Interfaces

The system includes various ports for interacting with:
- Input buttons for user interaction
- Mode selection switches
- Numerical displays
- Error indicators
- Memory addressing for administrative access

## 🛠️ Implementation Details

- Developed using IEEE standard libraries for maximum compatibility
- Uses synchronous design with button-triggered operations
- Implements error checking at multiple stages
- Memory-based architecture for storing state information

## 📋 Usage Scenario

1. Administrator loads currency and tickets into the system
2. User selects desired item/ticket quantity
3. System calculates and displays cost
4. User inserts money in various denominations
5. System validates payment and calculates change
6. Change is dispensed in optimal denomination mix
7. Tickets/items are dispensed

## 🧪 Testing

The design can be tested using standard VHDL testbenches to verify:
- Correct change calculation
- Proper error handling
- Accurate denomination tracking
- Reliable ticket dispensing
