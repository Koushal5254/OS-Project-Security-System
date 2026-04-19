#!/bin/bash

# Set password
password="1234"

echo "===== LOGIN REQUIRED ====="

# Login system (3 attempts)
for i in 1 2 3
do
    read -s -p "Enter Password: " pass
    echo ""

    if [ "$pass" == "$password" ]; then
        echo "Access Granted"
        break
    else
        echo "Wrong Password"
    fi

    if [ $i -eq 3 ]; then
        echo "Too many attempts! Exiting..."
        exit
    fi
done

# Main menu
while true
do
    echo ""
    echo "===== SECURE FILE SYSTEM ====="
    echo "1. Create File"
    echo "2. Create Folder"
    echo "3. Copy File"
    echo "4. Move File"
    echo "5. Delete File"
    echo "6. Rename File"
    echo "7. View File"
    echo "8. Exit"
    echo "Enter your choice:"
    read ch

    case $ch in
        1)
            read -p "Enter file name: " file
            touch "$file"
            echo "File created successfully"
            ;;
        
        2)
            read -p "Enter folder name: " folder
            mkdir "$folder"
            echo "Folder created successfully"
            ;;
        
        3)
            read -p "Enter source file: " s
            read -p "Enter destination: " d
            if [ -f "$s" ]; then
                cp "$s" "$d"
                echo "File copied successfully"
            else
                echo "File not found"
            fi
            ;;
        
        4)
            read -p "Enter file name: " f
            read -p "Enter destination folder: " d
            if [ -f "$f" ]; then
                mv "$f" "$d"
                echo "File moved successfully"
            else
                echo "File not found"
            fi
            ;;
        
        5)
            read -p "Enter file name to delete: " f
            if [ -f "$f" ]; then
                rm "$f"
                echo "File deleted successfully"
            else
                echo "File not found"
            fi
            ;;
        
        6)
            read -p "Enter old file name: " old
            read -p "Enter new file name: " new
            if [ -f "$old" ]; then
                mv "$old" "$new"
                echo "File renamed successfully"
            else
                echo "File not found"
            fi
            ;;
        
        7)
            read -p "Enter file name: " f
            if [ -f "$f" ]; then
                cat "$f"
            else
                echo "File not found"
            fi
            ;;
        
        8)
            echo "Exiting system..."
            exit
            ;;
        
        *)
            echo "Invalid choice"
            ;;
    esac
done