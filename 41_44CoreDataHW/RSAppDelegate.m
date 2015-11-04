//
//  RSAppDelegate.m
//  41_44CoreDataHW
//
//  Created by Roma Chopovenko on 10/26/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#pragma mark - Task
/*
 
 Вот CoreData и пройдена! Ведь не сложно совсем, правда?
 
 Итак домашнее задание создаем локальный мини ГуруКрафтер!
 
 Задание объемное, зато хорошо пройдемся по кордате :)
 */
#pragma mark - Pupil
/*
 Ученик.
 
 1. Делаем экран со списком юзеров. На пенели навигации есть плюсик, который добавляет нового юзера. При добавлении либо редактировании юзера мы переходим на экран, гдето можем вводить его данные в динамической(!) таблице: имя, фамилия, почтовый ящик.
 
 2. Юзеров можно добавлять, удалять и редактировать.
 
 3. Добавляем UITabBarController к проекту! Приложение стартует с него и наш экран с юзерами это всего лишь один из табов. Разберитесь с этим контроллером самостоятельно. Делайте его в сториборде. Для каждого контроллера в табах делайте навигейшн, чтобы была у всех панелька навигации. То есть идет так ТабКонтроллер -> таб-> Навигейшн -> наш экран
 */
#pragma mark - Student
/*
 Студент.
 
 4. Добавте экран с курсами. На этом экране вы можете добавить, редактировать и удалить курс. Так же само как и в случае с юзерами у вас открывается контроллер редактирования. Также динамическая таблица
 
 5. Впервой секции идут поля "название курса", "предмет", "отрасль" и преподаватель (имя и фамилия).
 
 6. Во второй секции идет список юзеров, которые подписаны на курс. Можно юзера удалить, тогда он не удаляется из юзеров - он удаляется из курса. Также есть ячейка добавить студентов. (например первая ячейка в секции)
 
 7. если я нажимаю на ячейку студента, то перехожу к его профайлу.
 */
#pragma mark - Master
/*
 Мастер
 
 8. Если я нажимаю на ячейке добавить сдудентов, то мне выходит модальный контроллер либо поповер, содержащий список всех юзеров, причем юзеры которые выбрали этот курс имеют галочки. Тут я могу снимать студентов с курса либо добавлять на этот курс новых студентов.
 
 9. Так же и для преподавателя: если нажать на ячейку с преподавателем - переходишь к экрану юзеров, но тут можно выбрать только одного на этот раз.
 
 10. Если преподаватель выбран, то ячейка "преподаватель" на экране редактирования курса должна содержать его имя и фамилию, если нет - должен быть текст "выберите преподавателя"
 
 11. Тоже самое сделайте на экране юзеров, мы ведь там сделали динамическую таблицу также. Добавте секцию "курсы, которые ведет" и добавьте туда все его курсы. Также добавьте секцию "курсы, которые изучает". Если у студента нет курсов в какой-либо из этих секций - не показывайте секцию :)
 */
#pragma mark - Superman
/*
 Супермен.
 
 12. Сделать все вышеперечисленное
 
 13. Сделайте третий экран - преподаватели. На этом экране будет выводиться список всех преподавателей сгрупированных по "предмету" (например программирование). У каждого преподавателя видно количество курсов (просто цифра) и если нажать на преподавателя, то переходишь в его профайл.
 
 Вот такое вот задание!
 */

#import "RSAppDelegate.h"
#import "RSSharedManager.h"

@implementation RSAppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [[RSSharedManager sharedManager] saveContext];
}







@end
