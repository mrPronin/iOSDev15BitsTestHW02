//
//  RITStudent.m
//  15BitsTestHW01
//
//  Created by Pronin Alexander on 15.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITStudent.h"

@implementation RITStudent

+ (id) studentWithName:(NSString*) name andSciencesCategories:(RITCourseraSciencesCategories) sciencesCategories {
    RITStudent* student = [[RITStudent alloc] init];
    student.name = name;
    student.sciencesCategories = sciencesCategories;
    return student;
}

- (NSString*) answerByType:(RITCourseraSciencesCategories) type {
    return self.sciencesCategories & type ? @"YES":@"NO";
}

- (NSString*) description {
    return [NSString stringWithFormat:@"%@", self.name];
}

- (NSString*) getSciencesCategories {
    return [NSString stringWithFormat:  @"%@\n"
            "Arts: %@\n"
            "Biology & Life Sciences: %@\n"
            "Business & Management: %@\n"
            "Chemistry: %@\n"
            "Computer Science: Artificial Intelligence: %@\n"
            "Computer Science: Software Engineering: %@\n"
            "Computer Science: Systems & Security: %@\n"
            "Computer Science: Theory: %@\n"
            "Economics & Finance: %@\n"
            "Education: %@\n"
            "Energy & Earth Sciences: %@\n"
            "Engineering: %@\n"
            "Food and Nutrition: %@\n"
            "Health & Society: %@\n"
            "Humanities: %@\n"
            "Information, Tech & Design: %@\n"
            "Law: %@\n"
            "Mathematics: %@\n"
            "Medicine: %@\n"
            "Music, Film and Audio: %@\n"
            "Physical & Earth Sciences: %@\n"
            "Physics: %@\n"
            "Social Sciences: %@\n"
            "Statistics and Data Analysis: %@\n"
            "Teacher Professional Development: %@",
            self.name,
            [self answerByType:RITCourseraSCArts],
            [self answerByType:RITCourseraSCBiologyAndLifeSciences],
            [self answerByType:RITCourseraSCBusinessAndManagement],
            [self answerByType:RITCourseraSCChemistry],
            [self answerByType:RITCourseraSCCSArtificialIntelligence],
            [self answerByType:RITCourseraSCCSSoftwareEngineering],
            [self answerByType:RITCourseraSCCSSystemsAndSecurity],
            [self answerByType:RITCourseraSCCSTheory],
            [self answerByType:RITCourseraSCEconomicsFinance],
            [self answerByType:RITCourseraSCEducation],
            [self answerByType:RITCourseraSCEnergyEarthSciences],
            [self answerByType:RITCourseraSCEngineering],
            [self answerByType:RITCourseraSCFoodAndNutrition],
            [self answerByType:RITCourseraSCHealthSociety],
            [self answerByType:RITCourseraSCHumanities],
            [self answerByType:RITCourseraSCInformationTechAndDesign],
            [self answerByType:RITCourseraSCLaw],
            [self answerByType:RITCourseraSCMathematics],
            [self answerByType:RITCourseraSCMedicine],
            [self answerByType:RITCourseraSCMusicFilmAndAudio],
            [self answerByType:RITCourseraSCPhysicalAndEarthSciences],
            [self answerByType:RITCourseraSCPhysics],
            [self answerByType:RITCourseraSCSocialSciences],
            [self answerByType:RITCourseraSCStatisticsAndDataAnalysis],
            [self answerByType:RITCourseraSCTeacherProfessionalDevelopment]
            ];
}

@end
