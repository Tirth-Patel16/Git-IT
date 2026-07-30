import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SeatLYApp());
}

class SeatLYApp extends StatefulWidget {
  const SeatLYApp({super.key});

  @override
  State<SeatLYApp> createState() => _SeatLYAppState();
}



class _SeatLYAppState extends State<SeatLYApp> {
  int totalSeats = 62;
  int availableSeats = 62;
  int bookedSeats = 0;
  int selectedSeats = 0;
  List<String> selectedSeatList = [];
  List<String> bookedSeatList = [];
  int totalPrice = 0;

  List<String> seats = [
    "A1",
    "A2",
    "A3",
    "A4",
    "A5",
    "A6",
    "A7",
    "A8",
    "B1",
    "B2",
    "B3",
    "B4",
    "B5",
    "B6",
    "B7",
    "B8",
    "C1",
    "C2",
    "C3",
    "C4",
    "C5",
    "C6",
    "C7",
    "C8",
    "D1",
    "D2",
    "D3",
    "D4",
    "D5",
    "D6",
    "D7",
    "D8",
    "E1",
    "E2",
    "E3",
    "E4",
    "E5",
    "E6",
    "E7",
    "E8",
  ];

  Widget seatBox(String seatNo, int price) {
    bool isSelected = selectedSeatList.contains(seatNo);
    bool isBooked = bookedSeatList.contains(seatNo);

    return GestureDetector(
      onTap: () {
  if (isBooked) return;

  setState(() {
    if (selectedSeatList.contains(seatNo)) {
      selectedSeatList.remove(seatNo);
      totalPrice -= price;
    } else {
      selectedSeatList.add(seatNo);
      totalPrice += price;
    }

    selectedSeats = selectedSeatList.length;
  });
},
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: isBooked
              ? const Color.fromARGB(255, 91, 35, 255)
              : isSelected
              ? const Color.fromARGB(255,8, 203, 0)
              : const Color.fromARGB(255, 255, 255, 255),
          
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            seatNo,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget seatRow(
    String left1,
    String left2,
    List<String> middleSeats,
    String right1,
    String right2,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          seatBox(left1,149),
          const SizedBox(width: 5),
          seatBox(left2,149),

          const SizedBox(width: 25),

          ...middleSeats.map(
            (seat) => Padding(
              padding: const EdgeInsets.only(right: 5),
              child: seatBox(seat,149),
            ),
          ),

          const SizedBox(width: 25),

          seatBox(right1,149),
          const SizedBox(width: 5),
          seatBox(right2,149),
        ],
      ),
    );
  }

  Widget reclinerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        12,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: seatBox("R${index + 1}", 299),
        ),
      ),
    );
  }

  Widget timeButton(String time, bool selected) {
  return Container(
    width: 95,
    height: 40,
    decoration: BoxDecoration(
      color: selected ? Colors.green : Colors.white,
      border: Border.all(color: Colors.green, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        time,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 59, 151, 151),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 59, 151, 151),
          title: Text(
  'SeatLY-select your seat',
  style: GoogleFonts.bebasNeue(
    fontSize: 34,
    color: Colors.white,
    letterSpacing: 2,
  ),
),
        ),
        body: Column(
          children: [
            const SizedBox(height: 0),

            Center(
  child: Column(
    children: [

      // Top Shadow
      

      const SizedBox(height: 10),

      // Main Screen
      
    

    ],
  ),
),

            const SizedBox(height: 10),

            Container(
  width: 370,
  padding: const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  ),
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 245, 245, 245),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const Text(
        "Spider-Man: Brand New Day",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 2),

      const Text(
        "PVR: Maruti Solaris, Anand",
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),

      const SizedBox(height: 8),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const Text(
            "Thu, 30 Jul",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [

              const Icon(
                Icons.confirmation_number,
                color: Colors.red,
                size: 16,
              ),

              const SizedBox(width: 4),

              Text(
                "$selectedSeats Ticket${selectedSeats == 1 ? "" : "s"}",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),

      const SizedBox(height: 8),

      Container(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),

  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [

      timeButton("07:30 AM", false),

      timeButton("10:30 AM", true),

      timeButton("01:30 PM", false),

      

    ],
  ),
),


    ],
  ),
),



            const SizedBox(height: 15),

            Center(
              child: Container(
                height: 77,
                width: 370,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
  color: const Color.fromRGBO(255, 255, 255, 1),
  borderRadius: BorderRadius.circular(20),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ],
),                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "$totalSeats",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Available",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "$availableSeats",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Booked",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "$bookedSeats",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Selected",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "$selectedSeats",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

             const SizedBox(height: 20),

          Container(
        width: 300,
        height: 8,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 225, 240, 255),
          borderRadius: BorderRadius.circular(20),
        ),
      ), 

      const SizedBox(height: 5), 

          Container(
        width: 360,
        height: 20,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 232, 245, 255),
              Color.fromARGB(255, 195, 225, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          
          borderRadius: BorderRadius.zero,

          border: Border.all(
            color: Color.fromARGB(255, 180, 210, 240),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        
      ),

            const SizedBox(height: 20),

            seatRow(
              "A1",
              "A2",
              ["A3", "A4", "A5", "A6", "A7", "A8"],
              "A9",
              "A10",
            ),

            const SizedBox(height: 8),

            seatRow(
              "B1",
              "B2",
              ["B3", "B4", "B5", "B6", "B7", "B8"],
              "B9",
              "B10",
            ),

            const SizedBox(height: 8),

            seatRow(
              "C1",
              "C2",
              ["C3", "C4", "C5", "C6", "C7", "C8"],
              "C9",
              "C10",
            ),

            const SizedBox(height: 8),

            seatRow(
              "D1",
              "D2",
              ["D3", "D4", "D5", "D6", "D7", "D8"],
              "D9",
              "D10",
            ),

            const SizedBox(height: 8),

            seatRow(
              "E1",
              "E2",
              ["E3", "E4", "E5", "E6", "E7", "E8"],
              "E9",
              "E10",
            ),

            const SizedBox(height: 20),

            reclinerRow(),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: const Color.fromARGB(255, 255, 255, 255), size: 14),
                SizedBox(width: 5),
                Text(
                  "Available",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 20),

                Icon(Icons.circle, color: const Color.fromARGB(255, 8, 203, 0), size: 14),
                SizedBox(width: 5),
                Text(
                  "Selected",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 20),

                Icon(Icons.circle, color: const Color.fromARGB(255, 91, 35, 255), size: 14),
                SizedBox(width: 5),
                Text(
                  "Booked",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Selected Seats Box
                Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Selected Seats",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "$selectedSeats",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Price Box
                Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "₹$totalPrice",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 330,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedSeatList.isEmpty) return;

                  setState(() {
                    bookedSeatList.addAll(selectedSeatList);

                    bookedSeats = bookedSeatList.length;

                    availableSeats = totalSeats - bookedSeats;

                    selectedSeatList.clear();

                    selectedSeats = 0;

                    totalPrice = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "BOOK SEAT",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
