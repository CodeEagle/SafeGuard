#import "SafeGuardOC.h"
#include <mach-o/dyld_images.h>

__attribute__((always_inline)) void k9FpnXPDNh0HvtXC(void) {
    #ifdef __arm64__
        __asm__ __volatile__(
            "mov X0,#0\n"
            "mov w16,#1\n"
            "svc #0x80"
        );
    #elif __arm__
        __asm__ __volatile__(
            "mov r0,#0\n"
            "mov r12,#1\n"
            "svc #80\n"
        );
    #else
        exit(0);
    #endif
}

__attribute__((always_inline)) void crz57CumFacZeOLh(void) {

    #ifdef __arm__
        __asm__ __volatile__(
             "mov r0,#31\n"
             "mov r1,#0\n"
             "mov r2,#0\n"
             "mov r12,#26\n"
             "svc #80\n"
        );
        
    #elif __arm64__
        __asm__ __volatile__(
             "mov x0, #31\n"
             "mov x1, #0\n"
             "mov x2, #0\n"
             "mov x3, #0\n"
             "mov x16, #26\n"
             "svc #0x80\n"
        );
    #endif
}

__attribute__((always_inline)) NSArray<NSString*>* gEUhH7gP7LWZv769(void) {
    // Get DYLD task infos
    struct task_dyld_info dyldInfo;
    mach_msg_type_number_t count = TASK_DYLD_INFO_COUNT;
    kern_return_t ret;
    ret = task_info(mach_task_self_, TASK_DYLD_INFO, (task_info_t)&dyldInfo, &count);
    if (ret != KERN_SUCCESS) {
        return @[];
    }
    // Get image array's size and address
    mach_vm_address_t imageInfos = dyldInfo.all_image_info_addr;
    struct dyld_all_image_infos *infos;
    infos = (struct dyld_all_image_infos *)imageInfos;
    uint32_t imageCount = infos->infoArrayCount;
    struct dyld_image_info * imageArray =( struct dyld_image_info *)infos->infoArray;
    if (imageArray == NULL) {
        return @[];
    }
    NSMutableArray *libs = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageCount; ++i) {
        struct dyld_image_info * image = imageArray + i;
        if (image == NULL) {
            continue;
        }
        const char* imageFilePath = image->imageFilePath;
        if (imageFilePath == NULL) {
            continue;
        }
        NSString * imagePath = [NSString stringWithUTF8String:imageFilePath];
        if (imagePath && [imagePath isKindOfClass:[NSString class]]) {
            [libs addObject:imagePath];
        }
    }
    return libs;
}


