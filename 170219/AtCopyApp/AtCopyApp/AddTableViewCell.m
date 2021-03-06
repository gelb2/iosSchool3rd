//
//  AddTableViewCell.m
//  AtCopyApp
//
//  Created by Jeheon Choi on 2017. 2. 22..
//  Copyright © 2017년 JeheonChoi. All rights reserved.
//

#import "AddTableViewCell.h"
#import "DataCenter.h"
#import "StatusCharacter.h"

@interface AddTableViewCell ()
<UIScrollViewDelegate, UITextFieldDelegate>

@property (nonatomic) NSInteger typeNum;
@property (nonatomic, weak) UIButton *btn1;
@property (nonatomic, weak) UIButton *btn2;
@property (nonatomic, weak) UIButton *btn3;
@property (nonatomic, weak) UIButton *btn4;
@property (nonatomic, weak) UITextField *tF;
@property (nonatomic, weak) UILabel *lB1;
@property (nonatomic, weak) UILabel *lB2;
@property (nonatomic, weak) UILabel *lB3;
@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation AddTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setCellType:reuseIdentifier];
    }
    
    return self;
}

/////////////////////////

- (void)setCellType:(NSString *)cellTypeStr {
    
    self.typeNum = [DataCenter addCellTypeStr2Num:cellTypeStr];
    
    // Set Subviews
    switch (self.typeNum) {
            
        case TITLE: {
            
            UITextField *tF = [[UITextField alloc] init];
            tF.placeholder = @"제목을 입력해주세요";
            [tF setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
            [tF setTextAlignment:NSTextAlignmentLeft];
            [tF setContentMode:UIViewContentModeCenter];
            [tF setFont:[UIFont boldSystemFontOfSize:30]];
            tF.delegate = self;
            [self addSubview:tF];
            self.tF = tF;
            
            break;
        }
        case DATE: {

            UILabel *lB1 = [[UILabel alloc] init];
            [lB1 setText:@"날짜 선택"];
            [lB1 setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
            [lB1 setFont:[UIFont boldSystemFontOfSize:20]];
            [self.contentView addSubview:lB1];
            self.lB1 = lB1;
            
            
            // 오늘 날짜 형식에 맞게 생성
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy. MM. dd. hh. mm. ss"];
            NSString *today = [dateFormatter stringFromDate:[NSDate date]];
            
            UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn1 setTitle:[today.description substringToIndex:12] forState:UIControlStateNormal];
            [btn1.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [btn1 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [btn1 setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
            [btn1 addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -32, 0, 0)];
            btn1.tag = 1;
            [self.contentView addSubview:btn1];
            self.btn1 = btn1;
            
            UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn2 setTitle:@"00:00" forState:UIControlStateNormal];
            [btn2.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [btn2 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [btn2 setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
            [btn2.titleLabel setTextAlignment:NSTextAlignmentLeft];
            [btn2 addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -32, 0, 0)];
            btn2.tag = 2;
            [self.contentView addSubview:btn2];
            self.btn2 = btn2;
            
            break;
        }
        case DATE2: {
            
            UILabel *lB1 = [[UILabel alloc] init];
            [lB1 setText:@"날짜 선택"];
            [lB1 setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
            [lB1 setFont:[UIFont boldSystemFontOfSize:20]];
            [self.contentView addSubview:lB1];
            self.lB1 = lB1;
            
            // 오늘 날짜 형식에 맞게 생성
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy. MM. dd. hh. mm. ss"];
            NSString *today = [dateFormatter stringFromDate:[NSDate date]];
            
            
            // 시작
            UILabel *lB2 = [[UILabel alloc] init];
            [lB2 setText:@"시작"];
            [lB2 setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
            [lB2 setFont:[UIFont boldSystemFontOfSize:14]];
            [self.contentView addSubview:lB2];
            self.lB2 = lB2;
            
            
            UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn1 setTitle:[today.description substringToIndex:12] forState:UIControlStateNormal];
            [btn1.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [btn1 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [btn1 setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
            [btn1 addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -32, 0, 0)];
            btn1.tag = 1;
            [self.contentView addSubview:btn1];
            self.btn1 = btn1;
            
            UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn2 setTitle:@"00:00" forState:UIControlStateNormal];
            [btn2.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [btn2 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [btn2 setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
            [btn2.titleLabel setTextAlignment:NSTextAlignmentLeft];
            [btn2 addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -32, 0, 0)];
            btn2.tag = 2;
            [self.contentView addSubview:btn2];
            self.btn2 = btn2;
            
            
            // 종료
            UILabel *lB3 = [[UILabel alloc] init];
            [lB3 setText:@"종료"];
            [lB3 setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
            [lB3 setFont:[UIFont boldSystemFontOfSize:14]];
            [self.contentView addSubview:lB3];
            self.lB3 = lB3;
            
            UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn3 setTitle:[today.description substringToIndex:12] forState:UIControlStateNormal];
            [btn3.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [btn3 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [btn3 setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
            [btn3 addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, -32, 0, 0)];
            btn3.tag = 3;
            [self.contentView addSubview:btn3];
            self.btn3 = btn3;
            
            UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn4 setTitle:@"00:00" forState:UIControlStateNormal];
            [btn4.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [btn4 setTitleColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1] forState:UIControlStateNormal];
            [btn4 setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
            [btn4.titleLabel setTextAlignment:NSTextAlignmentLeft];
            [btn4 addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btn4 setTitleEdgeInsets:UIEdgeInsetsMake(0, -32, 0, 0)];
            btn4.tag = 4;
            [self.contentView addSubview:btn4];
            self.btn4 = btn4;
            
            
            break;
        }
        case CHARACTERLIST:{
            
            UILabel *lB1 = [[UILabel alloc] init];
            [lB1 setText:@"캐릭터 선택"];
            [lB1 setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
            [lB1 setFont:[UIFont boldSystemFontOfSize:20]];
            [self.contentView addSubview:lB1];
            self.lB1 = lB1;
            
            UIScrollView *scrollView = [[UIScrollView alloc] init];
            scrollView.delegate = self;
            [self.contentView addSubview:scrollView];
            self.scrollView = scrollView;
            
            
            // Frame 고정으로 Character List View 한 번 생성
            // 후에, Collection View로 바꾸면 더 좋을 것 같음
            self.scrollView.frame = CGRectMake(16, 65, self.frame.size.width, 100);
            
            StatusCharacter *characterListView = [[StatusCharacter alloc] initWithViewVer:CHARACTER_LIST];
            self.scrollView.contentSize = characterListView.frame.size;
            [self.scrollView addSubview:characterListView];
            
            break;
        }
        default: {
            NSLog(@"여기 들어오면 안됨");
            break;
            
            // 기본 테이블 뷰 셀의 textField, accessoryView 사용이 안됨.
//            self.accessoryView = switcher;
            
//            UILabel *lB = [[UILabel alloc] init];
//            [lB setText:@"기간으로 설정"];
//            [lB setTextColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1]];
//            [lB setFont:[UIFont boldSystemFontOfSize:20]];
//            [self.contentView addSubview:lB];
//            self.lB = lB;
//
//            UISwitch *switcher = [[UISwitch alloc] init];
//            [switcher setOnTintColor:[UIColor colorWithRed:228/255.0 green:76/255.0 blue:88/255.0 alpha:1]];
//            [switcher addTarget:self action:@selector(selectedSwitcher:) forControlEvents:UIControlEventValueChanged];
//            switcher.tag = 0; // 기간으로 설정 : 0
//            [self.contentView addSubview:switcher];
//            self.switcher = switcher;

        }
    }
}

- (void)layoutSubviews {
    [self updateLayout];        // frame 재조정 적용
}

//////////////////////////////


- (void)updateLayout {
    
    CGFloat const MARGIN = 20;
    CGFloat offsetX = 16;
    CGFloat offsetY = MARGIN;
    
    
    switch (self.typeNum) {
        case TITLE:
            self.tF.frame = CGRectMake(offsetX, 0, self.frame.size.width - offsetX *2, self.frame.size.height);

            break;
            
        case DATE:
            self.lB1.frame = CGRectMake(offsetX, offsetY, 150, 35);
            
            offsetY += self.lB1.frame.size.height + MARGIN/2;
            self.btn1.frame = CGRectMake(offsetX, offsetY, 160, 45);
            
            offsetX += self.btn1.frame.size.width + 15;
            self.btn2.frame = CGRectMake(offsetX, offsetY, 105, 45);
            
            break;
            
        case DATE2:
            self.lB1.frame = CGRectMake(offsetX, offsetY, 150, 35);
            
            // 시작
            offsetY += self.lB1.frame.size.height + MARGIN/2;
            self.lB2.frame = CGRectMake(offsetX, offsetY, 100, 20);
            
            offsetY += self.lB2.frame.size.height + 5;
            self.btn1.frame = CGRectMake(offsetX, offsetY, 160, 45);
            
            offsetX += self.btn1.frame.size.width + 15;
            self.btn2.frame = CGRectMake(offsetX, offsetY, 105, 45);
            
            // 종료
            offsetX = 16;
            offsetY += self.btn1.frame.size.height + MARGIN/2 + 5;
            self.lB3.frame = CGRectMake(offsetX, offsetY, 100, 20);
            
            offsetY += self.lB3.frame.size.height + 5;
            self.btn3.frame = CGRectMake(offsetX, offsetY, 160, 45);
            
            offsetX += self.btn3.frame.size.width + 15;
            self.btn4.frame = CGRectMake(offsetX, offsetY, 105, 45);
            
            break;
            
        case CHARACTERLIST: {
            self.lB1.frame = CGRectMake(offsetX, offsetY, 150, 35);
            
//            offsetY += self.lB.frame.size.height + MARGIN/2;
//            self.scrollView.frame = CGRectMake(offsetX, offsetY, self.frame.size.width, 100);
//            
//            StatusCharacter *characterListView = [[StatusCharacter alloc] initWithViewVer:CHARACTER_LIST];
//            self.scrollView.contentSize = characterListView.frame.size;
//            [self.scrollView addSubview:characterListView];
            
            break;
        }
        default:
            NSLog(@"당연히 여기도 들어오면 안됨");
            break;
    }
}


//////////////// 입력 ////////////////

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (void)selectedBtn:(UIButton *)btn {
    NSLog(@"버튼 누름");
    
    if (btn.tag == 1) {
        
    }
}


@end
