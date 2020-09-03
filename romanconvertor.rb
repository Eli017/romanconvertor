def fromRoman(romanNumber)
    valid = ["M","D","C","L","X","V","I"]
    for c in romanNumber.chars
        if  !valid.include? c
            raise TypeError
        end
    end
    number = 0
    number += romanNumber.count("M") * 1000
    number += romanNumber.count("D") * 500
    number += romanNumber.count("C") * 100
    number += romanNumber.count("L") * 50
    number += romanNumber.count("X") * 10
    number += romanNumber.count("V") * 5
    number += romanNumber.count("I") * 1
    sub = addArabicNumber(romanNumber)
    number-sub
end

def addArabicNumber(romanNumber)
    number = 0
    if romanNumber.include? "IV"
        number += 2
    end
    if romanNumber.include? "XC"
        number += 20
    end
    if romanNumber.include? "CD"
        number += 200
    end
    number
end

def toRoman(arabicNumber)
    result = ""
    if arabicNumber < 1 || arabicNumber > 3999
        raise RangeError
    end
    result += "M" * (arabicNumber / 1000).floor
    arabicNumber-=(arabicNumber/1000).floor * 1000
    result += "D" * (arabicNumber / 500).floor
    arabicNumber-=(arabicNumber/500).floor * 500
    result += "CD" * (arabicNumber / 400).floor
    arabicNumber-=(arabicNumber/400).floor * 400
    result += "C" * (arabicNumber / 100).floor
    arabicNumber-=(arabicNumber/100).floor * 100
    result += "XC" * (arabicNumber / 90).floor
    arabicNumber-=(arabicNumber/90).floor * 90
    result += "L" * (arabicNumber / 50).floor
    arabicNumber-=(arabicNumber/50).floor * 50
    result += "XL" * (arabicNumber / 40).floor
    arabicNumber-=(arabicNumber/40).floor * 40
    result += "X" * (arabicNumber / 10).floor
    arabicNumber-=(arabicNumber/10).floor * 10
    result += "V" * (arabicNumber / 5).floor
    arabicNumber-=(arabicNumber/5).floor * 5
    result += "IV" * (arabicNumber / 4).floor
    arabicNumber-=(arabicNumber/4).floor * 4
    result += "I" * (arabicNumber / 1).floor
end