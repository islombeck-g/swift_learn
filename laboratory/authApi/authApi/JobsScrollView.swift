
import SwiftUI

struct JobsScrollView: View {
    var body: some View {
        //        VStack{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("gray"))
            VStack{
                Text("Инженер программист")
                
                    .lineLimit(1)
                    .font(.system(size: 17))
                    .frame(width: 255, alignment: .bottomLeading)// 255 = 287 - 16 - 16
                    .padding(.top, 20)
                
                Group{
                    HStack{
                        Text("Требуемый опыт работы:")
                        Text("3 - 6 лет")
                    }
                    .padding(.top, 4)
                    
                    Text("Полнаяа занятость, полный день")
                    
                        .padding(.top, 0)
                }
                .frame(width: 255, alignment: .leading)
                .foregroundColor(.gray)
                .lineLimit(1)
                .font(.system(size: 9))
                
                
                Text("от 40.000 до 60.000")
                    .font(.system(size: 14))
                    .frame(width: 255, alignment: .leading)
                    .lineLimit(1)
                    .padding(.top, 4)
                
                Text(
                    "Тинькофф Бизнес — экосистема сервисов для бизнеса, которые помогают оптимизировать рутинные процессы, сокращать расходы и находить точки роста.Мобильный банк для предпринимателей и компаний, в котором есть все инструменты для управления бизнесом. Из приложения можно не только отправлять платежи, а полностью покрывать потребности бизнеса - проверка репутации, выплата зарплаты, Торговый эквайринг, работа в ВЭД-ом, бухгалтерские документы, управление кредитами/вкладами. Мы поддерживаем mobile-full и среди наших конкурентов лидеры в этом направлении.Продукт, над которым мы трудимся - под прицелом у бизнеса. Мы хотим делать mobile-first/mobile-full, и мы приоритетнее, чем Web. 85 % mobile-only клиентов.Среди клиентов — более 600 000 компаний и предпринимателей по всей России")
                .font(.system(size: 12))
                .frame(width: 255, alignment: .leading)
                .lineLimit(3)
                .padding(.top, 1)
                
                
                
                
                Spacer()
                
                
            }
            //                .padding(.leading,16)
            
            
            
            
            
            
        }.frame(width:287, height: 173)
        
        //        }
    }
    
}


struct JobsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        JobsScrollView()
        //            .previewLayout(.sizeThatFits)
    }
}
