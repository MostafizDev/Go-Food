/*
import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Log In': 'Log In',
          'Choose language': 'Choose language',
          "Don't have a account": "Don't have a account?",
          "Register": "Register",
          "Accept and Continue": "Accept & Continue",
          "Terms and Policy": "Terms and Policy",
          "Notice": "Notice",
          "Notice Text":
              """Please gather these information before starting registration""",
          "1. Your Photo": "1. Your Photo",
          "2. Your NID": "2. Your NID",
          "3. Your Blood Group": "3. Your Blood Group",
          "4. Nominee Photo": "4. Nominee Photo",
          "5. Nominee NID": "5. Nominee NID",
          "Next": "Next",
          "Phone Verification": "Phone Verification",
          "Phone Number": "Phone Number",
          "OTP will be sent in this number": "OTP will be sent in this number",
          "Submit": "Submit",
          "Enter a Number": "Enter a Number",
          "Enter a valid number": "Enter a valid number",
          "No internet available": "No internet available",
          "OTP doesn't match": "OTP doesn't match",
          "Enter OTP": "Enter OTP",
          "OTP has been sent to your number":
          "OTP has been sent to your number",
          "Didn't get any text?": "Didn't get any text?",
          "Resend": "Resend",
          "Request sent": "Request sent",
          "Please wait 15 seconds": "Please wait 15 seconds",
          "OTP not valid": "OTP not valid",
          "Basic Information": "Basic Information",
          "Success!": "Success!",
          "Your Name*": "Your Name*",
          "Enter your full Name": "Enter your full Name",
          "Please enter your name": "Please enter your name",
          "Father's Name*": "Father's Name*",
          "Name is not correct": "Name is not correct",
          "Enter your father's Name": "Enter your father's Name",
          "Mother's Name*": "Mother's Name*",
          "Enter your mother's Name": "Enter your mother's Name",
          "Advanced Payment Disclaimer":
              "Pay in Advanced to be star member in our community and gain "
                  "extra points per post and comment. You will also recieve"
                  " big discounts in the shop.",
          "Terms and policy": """
১) আগামীতে প্রতিদিন ৫/- (পাঁচ) টাকা করে চাঁদা দিতে হবে,“MseaB” উন্নয়নের লক্ষ্যে। সংগঠনের চাঁদা যথানিয়মে পরিশোধ করতে হবে। কোনোক্রমে বকেয়া রাখা যাবে না। বকেয়া চাঁদা এর মেয়াদ ১ (এক) মাস উত্তীর্ণ হইলে সংগঠনের সকল সুযোগ-সুবিধা হইতে বঞ্চিত হইবে। এবং ২ (দুই) মাস পরে সদস্য লিখিতভাবে সংগঠনকে কোন কিছু না জানালে, বকেয়া চাঁদা এর মেয়াদ ৩ (তিন) মাস উত্তীর্ণ হলে বিনা নোটিশে সদস্যপদ বাতিল বলিয়া গণ্য হইবে।

২) সংগঠনের কোনো সদস্য মৃত্যুবরণ করিলে তার নমিনী কে সংগঠনের পক্ষ হইতে ১,০০,০০০ (এক লক্ষ) টাকা সহায়তা প্রদান করা হইবে।

৩) অ্যাসোসিয়েশনের মোবাইল ও মোবাইল পণ্য ছাড়া অন্য কোম্পানির যে কোনো পণ্য সদস্যের প্রয়োজন হলে, সদস্য তা অ্যাসোসিয়েশনকে জানালে ওই পণ্য বা পণ্য সামগ্রী ঢাকা বা চায়না হইতে সংগ্রহ করে প্রকৃত মূল্যে সদস্যকে প্রদান করা হবে। যদি ঢাকা বা চায়নায় পাওয়া যায়।

৪) মোবাইল H/W ও S/W সংক্রান্ত তথ্য দিয়ে প্রতিটি থানা সদস্যকে যথা উপযুক্ত ট্রেনিং দিয়ে (টেকনিক্যাল ট্রেনিং ইনিস্টিটিউট/টেকনিক্যাল ইউনিভার্সিটি প্রতিষ্ঠা করে) একজন দক্ষ মোবাইল টেকনিশিয়ান বা মোবাইল ইঞ্জিনিয়ার হিসেবে গড়ে তোলা হবে।

৫) প্রতিষ্ঠান সদস্যদের শান্তি-শৃঙ্খলা বজায় রেখে চলিতে হইবে

৬) কর্মস্থলের ঠিকানা পরিবর্তন করা হলে সঙ্গে সঙ্গে এসোসিয়েশনকে অবহিত করিতে হইবে।

৭) উপরে উল্লেখিত সুবিধাগুলো সদস্যপদ লাভের এক বৎসর পূর্তি হইলে কার্যকর হইবে। চাঁদা বকেয়া থাকিলে সে উল্লেখিত সুবিধা হইতে বঞ্চিত হবে।

৮) সদস্যের ছেলেমেয়েদের মধ্যে জেলা ভিত্তিক বাৎসরিক বৃত্তি প্রদান করা হবে যাতে পঞ্চম শ্রেণির বৃত্তির টাকা অষ্টম শ্রেণি পর্যন্ত এবং অষ্টম শ্রেণির বৃত্তি টাকায় এস.এস.সি পর্যন্ত লেখাপড়া চালাতে পারে।

৯) উপরোক্ত সুবিধাগুলো ছাড়াও সদস্যের প্রয়োজনে ভবিষ্যতে যে কোনো সুবিধা ও অসুবিধা সাথে সংযোজন করা যেতে পারে।

১০) নির্বাহী পরিষদের সদস্যগণ প্রয়োজন সাপেক্ষে সংগঠনের যে কোন কমিটি, কিংবা সংগঠন সংশ্লিষ্ট যেকোনো বিষয়ে হস্তক্ষেপ করার সিদ্ধান্ত নেয়ার অধিকার রাখে। সুষ্ঠু তদন্তের মাধ্যমে সকল সহায়তা প্রদান করা হইবে। ফর্মের নাম ঠিকানা কোনরকম কাটাকাটি বা ঘষামাজা করা যাইবে না। প্রয়োজনে নতুন ফরম সংগ্রহ করতে পারেন।

আমি অত্র এসোসিয়েশনের সকল শর্তাবলী মানিয়ে নিলাম।
                """
        },
        'bn_BD': {
          'Log In': 'লগইন',
          'Choose language': 'ভাষা নির্বাচন করুন',
          "Don't have a account": "পূর্ববর্তী অ্যাকাউন্ট নেই?",
          "Register": "রেজিষ্টার",
          "Accept and Continue": "সম্মতি প্রদান করে এগিয়ে যান",
          "Terms and Policy": "শর্ত এবং নীতিমালা",
          "Notice": "নোটিশ",
          "Notice Text":
              """রেজিষ্ট্রেশন শুরু করার পুর্বে নিচের তথ্যসমুহ সংগ্রহ করুন""",
          "1. Your Photo": "১) আপনার ছবি",
          "2. Your NID": "২) আপনার জাতীয় পরিচয় পত্র",
          "3. Your Blood Group": "৩) আপনার রক্তের গ্রুপ",
          "4. Nominee Photo": "৪) নমিনির ছবি",
          "5. Nominee NID": "৫) নমিনির জাতীয় পরিচয় পত্র",
          "Next": "পরবর্তী",
          "Phone Verification": "ফোন নাম্বার যাচাই",
          "Phone Number": "ফোন নাম্বার",
          "OTP will be sent in this number": "এই নাম্বার-এ OTP পাঠানো হবে",
          "Submit": "পাঠান",
          "Enter a Number": "ফোন নাম্বার লিখুন",
          "Enter a valid number": "আপনার নাম্বারটি সঠিক নয়",
          "No internet available": "ইন্টারনেট সংযোগ নেই",
          "Please Enter Correct Password":"দয়া করে সঠিক পাসওয়ার্ড দিন",
          "OTP doesn't match": "OTP ভুল হয়েছে",
          "Enter OTP": "OTP দিন",
          "OTP has been sent to your nubmer":
              "আপনার নাম্বার-এ OTP পাঠানো হয়েছে",
          "Didn't get any text?": "কোনো এসএমএস পাননি",
          "Resend": "আবার পাঠান",
          "Request sent": "আবেদন করা হয়েছে",
          "Please wait 15 seconds": "দয়া করে ১৫ সেকেন্ড অপেক্ষা করুন",
          "OTP not valid": "OTP সঠিক নয়",
          "Basic Information": "প্রাথমিক তথ্য",
          "Success!": "সফল",
          "Your Name*": "আপনার নাম*",
          "Enter your full Name": "পুর্ণ নাম লিখুন",
          "Please enter your name": "দয়া করে আপনার নাম লিখুন",
          "Father's Name*": "পিতার নাম*",
          "Father's Name": "পিতার নাম",
          "Name is not correct": "নামটি সঠিক নয়",
          "Enter your father's Name": "আপনার পিতার নাম লিখুন",
          "Mother's Name*": "মাতার নাম*",
          "Mother's Name": "মাতার নাম",
          "Enter your mother's Name": "আপনার মাতার নাম লিখুন",
          "Number of children": "সন্তানের সংখ্যা",
          "Enter the number of children": "আপনার সন্তানের সংখ্যা লিখুন",
          "Your NID number": "আপনার পরিচয় পত্রের নাম্বার",
          "Enter your NID number": "আপনার পরিচয় পত্রের নাম্বার লিখুন",
          "NID number is not correct": "পরিচয় পত্রের নাম্বার সঠিক নয়",
          "Blood Group*": "রক্তের গ্রুপ*",
          "Blood Group": "রক্তের গ্রুপ",
          "Your Blood Group": "আপনার রক্তের গ্রুপ নির্বাচন করুন",
          "Please select a blood group": "দয়া করে রক্তের গ্রুপ নির্বাচন করুন",
          "Please fill the forms correctly":
              "দয়া করে ফর্মগুলো সঠিকভাবে পূরণ করুন",
          "Your Photo*": "আপনার ছবি*",
          "Your Photo": "আপনার ছবি",
          "Contact and Business": "ব্যবসা এবং যোগাযোগ",
          "Email Address*": "ইমেইল ঠিকানা*",
          "Email Address": "ইমেইল",
          "Present Address": "বর্তমান ঠিকানা",
          "Permanent Address*": "স্থায়ী ঠিকানা*",
          "Permanent Address": "স্থায়ী ঠিকানা",
          "Business Name*": "ব্যাবসার নাম*",
          "Business Name": "ব্যাবসার নাম",
          "Business Address*": "ব্যাবসার ঠিকানা*",
          "Business Address": "ব্যাবসার ঠিকানা",
          "Enter Your Email Address": "আপনার ইমেইল দিন",
          "Enter Your Present Address": "আপনার বর্তমান ঠিকানা লিখুন",
          "Enter Your Permanent Address": "আপনার স্থায়ী ঠিকানা লিখুন",
          "Enter Your Business Name": "আপনার ব্যাবসায়িক প্রতিষ্ঠানের নাম লিখুন",
          "Enter Your Business Address":
              "আপনার ব্যাবসায়িক প্রতিষ্ঠানের ঠিকানা লিখুন",
          "Email is invalid": "ইমেলটি সঠিক নয়",
          "Enter a valid address": "ঠিকানাটি সঠিক নয়",
          "At least 6 characters": "সর্বনিম্ন ৬টি অক্ষর",
          "Nominee Info": "নমিনির তথ্য",
          "Enter Nominee NID Number":
              "নমিনির জাতীয় পরিচয় পত্রের নাম্বার লিখুন",
          "Nominee NID Number*": "নমিনির জাতীয় পরিচয় পত্রের নাম্বার*",
          "Nominee NID Number": "নমিনির জাতীয় পরিচয় পত্রের নাম্বার",
          "Nominee Photo*": "নমিনির ছবি*",
          "Nominee Photo": "নমিনির ছবি",
          "Relation with Nominee*": "নমিনির সাথে সম্পর্ক",
          "Relation with Nominee": "নমিনির সাথে সম্পর্ক",
          "Enter Relation with Nominee": "নমিনির সাথে সম্পর্ক",
          "Enter Nominee's Phone Number": "নমিনির ফোন নাম্বার লিখুন",
          "Nominee's Phone Number*": "নমিনির ফোন নাম্বার*",
          "Nominee's Phone Number": "নমিনির ফোন নাম্বার",
          "Enter Nominee's Address": "নমিনির ঠিকানা লিখুন",
          "Nominee Address*": "নমিনির ঠিকানা*",
          "Nominee Address": "নমিনির ঠিকানা",
          "Enter Your Nominee's Full Name": "নমিনির পুর্ণ নাম",
          "Nominee Name*": "নমিনির নাম*",
          "Nominee Name": "নমিনির নাম",
          "Relation is empty": "এই ঘরটি পুরণ করুন",
          "Re-Enter New Password": "",
          "Create New Password": "",
          "Create New Password*": "",
          "Account Security": "অ্যাকাউন্টের নিরাপত্তা",
          "Password doesn't match": "পাসওয়ার্ড মিলেনি",
          "Please select a photo": "দয়া করে আপনার ছবি যুক্ত করুন",
          "Login to MSEAB": "লগিন করুন",
          "Password": "পাসওয়ার্ড",
          "Enter password": "পাসওয়ার্ড দিন",
          "Remember me": "আমার তথ্য মনে রাখুন",
          "Phone or password is wrong": "ফোন অথবা পাসওয়ার্ড ভুল আছে",
          "Recover Your Account?": "অ্যাকাউন্ট পুনরুদ্ধার করুন?",
          "Forgot password?": "পাসওয়ার্ড ভুলে গেছেন?",
          "Forgot password": "পাসওয়ার্ড ভুলে গেছেন",
          "Check Account": "অ্যাকাউন্ট যাচাই করুন",
          "Ensure Account": "অ্যাকাউন্ট যাচাই",
          "Set New Password": "নতুন পাসওয়ার্ড দিন",
          "Enter New Password": "নতুন পাসওয়ার্ড দিন",
          "Something went wrong, Please try again": "দয়া করে আবার চেষ্টা করুন",
          "Fees": "ফি",
          "Pay Now": "পরিশোধ করুন",
          "Advanced Payment": "অগ্রিম পরিশোধ",
          "Payment History": "পরিশোধের ইতিহাস",
          "Report Issue": "সমস্যা জানান",
          "Disclaimer": "বিশেষ দ্রষ্টব্যঃ",
          "Advanced Payment Disclaimer":
              "অগ্রিম লেনদেন করে আমাদের স্টার কাস্টমার এ পরিণত হন"
                  " এবং আমাদের কমিউনিটি তে নানা ধরনের অফার উপভোগ করুন।"
                  " এছাড়াও আমাদের শপে আপনি অনেক ডিসকাউন্ট পাবেন।",
          "Read more": "আরও পড়ুন",
          "Select the number of weeks": "সপ্তাহের সংখ্যা নির্বাচন করুন",
          "Your Total Amount is:": "সর্বোমোট টাকার পরিমাণঃ",
          "Please select number of weeks":
              "দয়া করে সপ্তাহের সংখ্যা নির্বাচন করুন",
          "Your payment was successful": "আপনার লেনদেন সফল হয়েছে",
          "Your payment was unsuccessful": "আপনার লেনদেন অসফল হয়েছে",
          "Enter a title": "শিরোনাম দিন",
          "Title can't be blank": "শিরোনাম দিন",
          "Description": "বর্ননা",
          "At least 20 characters": "সর্বোনিম্ন ২০ অক্ষর",
          "Coming soon": "শীঘ্রই আসছে",
          "Server Error!": "সার্ভার ত্রুটি ঘটেছে",
          "You have already paid this weeks bill":
              "আপনার এই সপ্তাহের টাকা পরিশোধ করা আছে",
          "Paid": "জমা",
          "Due": "বকেয়া",
          "Next Date": "পরবর্তী তারিখ",
          "Profile": "প্রোফাইল",
          "Terms and policy": """
১) আগামীতে প্রতিদিন ৫/- (পাঁচ) টাকা করে চাঁদা দিতে হবে,“MseaB” উন্নয়নের লক্ষ্যে। সংগঠনের চাঁদা যথানিয়মে পরিশোধ করতে হবে। কোনোক্রমে বকেয়া রাখা যাবে না। বকেয়া চাঁদা এর মেয়াদ ১ (এক) মাস উত্তীর্ণ হইলে সংগঠনের সকল সুযোগ-সুবিধা হইতে বঞ্চিত হইবে। এবং ২ (দুই) মাস পরে সদস্য লিখিতভাবে সংগঠনকে কোন কিছু না জানালে, বকেয়া চাঁদা এর মেয়াদ ৩ (তিন) মাস উত্তীর্ণ হলে বিনা নোটিশে সদস্যপদ বাতিল বলিয়া গণ্য হইবে।

২) সংগঠনের কোনো সদস্য মৃত্যুবরণ করিলে তার নমিনী কে সংগঠনের পক্ষ হইতে ১,০০,০০০ (এক লক্ষ) টাকা সহায়তা প্রদান করা হইবে।

৩) অ্যাসোসিয়েশনের মোবাইল ও মোবাইল পণ্য ছাড়া অন্য কোম্পানির যে কোনো পণ্য সদস্যের প্রয়োজন হলে, সদস্য তা অ্যাসোসিয়েশনকে জানালে ওই পণ্য বা পণ্য সামগ্রী ঢাকা বা চায়না হইতে সংগ্রহ করে প্রকৃত মূল্যে সদস্যকে প্রদান করা হবে। যদি ঢাকা বা চায়নায় পাওয়া যায়।

৪) মোবাইল H/W ও S/W সংক্রান্ত তথ্য দিয়ে প্রতিটি থানা সদস্যকে যথা উপযুক্ত ট্রেনিং দিয়ে (টেকনিক্যাল ট্রেনিং ইনিস্টিটিউট/টেকনিক্যাল ইউনিভার্সিটি প্রতিষ্ঠা করে) একজন দক্ষ মোবাইল টেকনিশিয়ান বা মোবাইল ইঞ্জিনিয়ার হিসেবে গড়ে তোলা হবে।

৫) প্রতিষ্ঠান সদস্যদের শান্তি-শৃঙ্খলা বজায় রেখে চলিতে হইবে

৬) কর্মস্থলের ঠিকানা পরিবর্তন করা হলে সঙ্গে সঙ্গে এসোসিয়েশনকে অবহিত করিতে হইবে।

৭) উপরে উল্লেখিত সুবিধাগুলো সদস্যপদ লাভের এক বৎসর পূর্তি হইলে কার্যকর হইবে। চাঁদা বকেয়া থাকিলে সে উল্লেখিত সুবিধা হইতে বঞ্চিত হবে।

৮) সদস্যের ছেলেমেয়েদের মধ্যে জেলা ভিত্তিক বাৎসরিক বৃত্তি প্রদান করা হবে যাতে পঞ্চম শ্রেণির বৃত্তির টাকা অষ্টম শ্রেণি পর্যন্ত এবং অষ্টম শ্রেণির বৃত্তি টাকায় এস.এস.সি পর্যন্ত লেখাপড়া চালাতে পারে।

৯) উপরোক্ত সুবিধাগুলো ছাড়াও সদস্যের প্রয়োজনে ভবিষ্যতে যে কোনো সুবিধা ও অসুবিধা সাথে সংযোজন করা যেতে পারে।

১০) নির্বাহী পরিষদের সদস্যগণ প্রয়োজন সাপেক্ষে সংগঠনের যে কোন কমিটি, কিংবা সংগঠন সংশ্লিষ্ট যেকোনো বিষয়ে হস্তক্ষেপ করার সিদ্ধান্ত নেয়ার অধিকার রাখে। সুষ্ঠু তদন্তের মাধ্যমে সকল সহায়তা প্রদান করা হইবে। ফর্মের নাম ঠিকানা কোনরকম কাটাকাটি বা ঘষামাজা করা যাইবে না। প্রয়োজনে নতুন ফরম সংগ্রহ করতে পারেন।

আমি অত্র এসোসিয়েশনের সকল শর্তাবলী মানিয়ে নিলাম।
                """,
          "Community": "কমিঊনিটি",
          "Shop": "দোকান",
          "About MSEAB": "MSEAB সম্পর্কে",
          "Terms & Policy": "শর্তাদি & নীতি",
          "Invite Friends": "বন্ধুদের আমন্ত্রণ",
          "Contact Support": "সাহায্য নিন",
          "Rate This App": "অ্যাপের রেটিং দিন",
          "Logout": "লগ আউট",
          "Search":"খুজুন",
          "Order List": "অর্ডারের তালিকা",
          "Amount":"পরিমাণ",
          "Status":"অবস্থা",
          "complete":"পরিশোধিত",
          "pending":"পরিশোধিত নয়",
          "Cart":"বাছাইকৃত তালিকা",
          "Swipe left to remove item":"বাতিল করতে বামে সরান",
          "Total":"মোট",
          "Enter Shipping Address":"পন্য গ্রহনের ঠিকানা দিন",
          "All":"নতুন",
          "Top":"ট্রেন্ডিং",
          "Own":"নিজের",
          "Write a comment":"মন্তব্য লিখুন",
          "Please write a comment":"দয়া করে মন্তব্য লিখুন",
          "Commented":"মন্তব্য করা হয়েছে",
          "Post Details":"সম্পুর্ন পোস্ট",
          "Add a photo":"ছবি যুক্ত করুন",
          "Report an Issue":"সমস্যা জানান",
          "Select number of weeks":"সপ্তাহের সংখ্যা নির্বাচন করুন",
          "Do you want to logout?":"আপনি কি লগআউট করতে চান?",
          "Do you want to delete?":"আপনি কি ডিলেট করতে চান?",
          "Do you want to flag?":"আপনি কি ফ্লাগ করতে চান?",
          "YES".tr:"হ্যা",
          "NO".tr:"না",
          "Flagged":"ফ্লাগ করা হয়েছে",
          "Order Details":"অর্ডারের বিবরন",
          "Notification":"নোটিফিকেশন",
          "Followers":"ফলোয়ারস",
          "Points":"পয়েন্টস",
          "Contact and Address":"যোগাযোগ এবং ঠিকানা",
          "About User":"ব্যাবহারকারীর তথ্য",
          "Private Data":"গোপন তথ্য",
          "Full Profile":"সম্পুর্ন প্রোফাইল",
          "Edit Profile":"প্রোফাইল সংশোধন",
          "Item removed from cart":"সরানো হয়েছে",
          "Save":"সেভ করুন",
          "Add New Post":"নতুন পোস্ট সংযোজন",
          "Enter description":"বর্ননা দিন",
          "Add a thumbnail":"ছবি যুক্ত করুন",
          "Post":"পোস্ট করুন",
          "Delete":"ডিলেট করুন",
          "Flag":"ফ্লাগ করুন",
          "Example: Title, Name...":"যেমনঃ নাম, শিরোনাম...",
          "Are you sure?":"আপনি কি বেড়িয়ে যেতে চান?",
          "Select support type":"সাহায্যের ধরন নির্বাচন করুন",
          "Support Type":"সাহায্যের ধরন",
          "Enter a description":"বর্ননা দিন",
          "Please select your Support Type":"দয়া করে সাহায্যের ধরন নির্বাচন করুন",
          "Please Enter Shipping Address First":"দয়া করে পন্য গ্রহনের ঠিকানা দিন",
          "Please Chose Product First":"দয়া করে একটি পন্য নির্বাচন করুন"
        },
      };
}
*/
