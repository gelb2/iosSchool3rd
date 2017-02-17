####2017.02.15 - #24 (6주차 2번째 수업)

## 알고리즘 문제
####Q.  
약수의 합 출력  
ex) 12의 약수 = 1, 2, 3, 4, 6, 12 -> 약수 sum = 28

####A.  
```objc
- (NSInteger)factorsSumWithNum:(NSInteger)num {
    NSInteger sum = 0;
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 1; i <= num; i++) {
        if (num % i == 0) {
            sum += i;
            [arr addObject:[NSString stringWithFormat:@"%ld", i]];
        }
    }
    NSLog(@"%@", arr);
    NSLog(@"약수의 합 : %ld", sum);
    
    return sum;
}

```

## UITableView

- ClashRoyaleUITableView  

 <a data-flickr-embed="true"  href="https://www.flickr.com/photos/145858067@N03/32075037634/in/dateposted-public/" title="ClashRoyaleUITableView"><img src="https://c1.staticflickr.com/4/3683/32075037634_c7b4162c95_z.jpg" width="361" height="640" alt="ClashRoyaleUITableView"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>
