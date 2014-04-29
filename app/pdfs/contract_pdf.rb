# encoding: utf-8
class ContractPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(order)
    super(top_margin: 40, left_margin: 40, right_margin: 40, bottom_margin: 40)
    @order = order

    font_path = "#{Rails.root}/app/assets/fonts/Helvetica.dfont"
    font_families.update("Helvetica" => {
      :normal => {:file => font_path, :font => "Helvetica"},
      :italic => {:file => font_path, :font => "Helvetica-Italic"},
      :bold => {:file => font_path, :font => "Helvetica-Bold"},
      :bold_italic => {:file => font_path, :font => "Helvetica-BoldItalic"},
    })

    foo
  end

  def foo
    font "Helvetica"
    text "CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM", style: :bold, align: :center
    move_down 8
    text "Độc Lập - Tự Do - Hạnh Phúc", align: :center
    move_down 3
    text "---", align: :center
    move_down 25
    text "HỢP ĐỒNG THUÊ THIẾT BỊ", align: :center, size: 20, style: :bold
    move_down 10
    text "SỐ: #{@order.number}", align: :center, size: 14
    move_down 35
    text "-  Căn cứ vào Bộ Luật Dân sự hiện hành số 33/2005/QH11 ngày 14/06/2005 có hiệu lực ngày 01/01/2006 và Bộ Luật Thương mại số 36/2005/QH11 ngày 14/06/2005 có hiệu lực từ ngày 01/01/2006 của Quốc hội nước Cộng hòa Xã hội Chủ nghĩa Việt Nam;", leading: 5
    text "-  Căn cứ vào nhu cầu và năng lực của mỗi bên"
    move_down 20
    text "Hôm nay, ngày #{Date.today.day} tháng #{Date.today.month} năm #{Date.today.year}"
    move_down 7
    text "Tại CÔNG TY TNHH TM-DV HTE, chúng tôi gồm:"
    move_down 20

    p "Bên A: (Bên cho thuê): CÔNG TY TNHH TM-DV HTE", style: :bold
    p "Đại diện: Ông.Nghiêm Xuân Hoàng"
    p "Chức vụ: Giám đốc"
    p "Địa chỉ: 98 Thích Quảng Đức, Phường 5, Quận Phú Nhuận, TP.HCM"
    p "Điện thoại: (08) 6292 1939"
    p "Mã số thuế: 0311996915"
    move_down 20
    p "Bên B (Bên thuê):................................................................................................................................", style: :bold
    p "Địa chỉ:.................................................................................................................................................."
    p "Điện thoại: " + '.' * 140
    p "Email: " + '.' * 147
    p "Số CMND:........................................ Ngày cấp:................................. Nơi cấp:...................................."

    start_new_page

    p "Hai bên thống nhất với nội dung sau:", style: :bold
    move_down 15
    p "<u>Điều 1: Mục đích</u>", style: :bold, inline_format: true
    p "Bên A đồng ý cho Bên B thuê máy game PlayStation 3 cho mục đích giải trí."
    p "Máy móc thiết bị bao gồm:"

    data = [['Số TT', 'Tên Thiết Bị', 'Số Lượng', "Số Seri"]]
    counter = 1
    @order.items.each do |item|
      item.inventory_items.each do |inventory|
        row = [counter, inventory.display_name, 1, inventory.serial]
        data << row
        counter += 1
      end
    end
    data << [counter, 'Dây HDMI', 1, '----']
    data << [counter + 1, 'Dây Sạc USB', 1, '----']
    data << [counter + 2, 'Dây Nguồn', 1, '----']

    t = make_table(data, width: bounds.width, row_colors: ["FFFFFF", "F1F1F1"]) do
       column(0).style(width: 50, align: :center)
       column(2).style(width: 80, align: :center)
       column(3).style(width: 150, align: :center)
       rows(0..-1).style(leading: 5)
    end

    t.draw

    move_down 15
    p "<u>Điều 2: Địa điểm giao thiết bị và thời gian thuê</u>", style: :bold, inline_format: true
    p "Bên A giao thiết bị cho bên B tại địa chỉ:..........................................................................................."
    p "." * 155
    p "Thời hạn thuê: %s tuần" % @order.rental_weeks
    if @order.delivered_at
      p "Từ: %s     Đến: %s" % [@order.delivered_at.strftime('%d/%m/%Y'), (@order.delivered_at + @order.rental_weeks.week).strftime('%d/%m/%Y')]
    else
      p "Từ: ........................................................ Đến: ........................................................"
    end
    move_down 15
    p "<u>Điều 3: Giá trị hợp đồng và hình thức thanh toán</u>", style: :bold, inline_format: true
    p "3.1 Giá trị hợp đồng", style: :bold
    p "Tổng giá trị hợp đồng: %s đồng" % number_with_delimiter(@order.total)
    move_down 10
    p "3.2 Phương thức thanh toán", style: :bold
    p "Thanh toán bằng tiền mặt khi nhận máy."
    move_down 10

    p "<u>Điều 4: Trách nhiệm mỗi bên</u>", style: :bold, inline_format: true
    p "4.1 Trách nhiệm bên A:", style: :bold
    p "Đảm bảo thiết bị hoạt động tốt khi bàn giao"
    p "4.2 Trách nhiệm bên B:", style: :bold
    p "-  Nhận máy và sử dụng đúng quy trình kỹ thuật."
    p "-  Tự chịu trách nhiệm rủi ro khi sử dụng máy móc, thiết bị thuê."
    p "-  Đảm bảo thực hiện đúng theo Điều 2 nêu trên."
    p "-  Khi xảy ra hỏng hóc, bên B phải thông báo ngay cho bên A để bên A tiến hành kiểm tra thiết bị. Nếu lỗi phát sinh do sử dụng không đúng kỹ thuật, cháy nổ, thiên tai bên B phải chịu trách nhiệm bồi thường cho bên A theo mức độ thiệt hại.", leading: 5

    move_down 10
    p "<u>Điều 5: Trách nhiệm do vi phạm hợp đồng</u>", style: :bold, inline_format: true
    p "5.1 Vi phạm hợp đồng là việc một Bên không thực hiện hoặc thực hiện không đầy đủ nghĩa vụ hoặc cam kết của mình theo Hợp đồng.", leading: 5
    p "5.2 Bên vi phạm hợp đồng phải trả cho bên bị vi phạm tiền phạt vi phạm hợp đồng và trong trường  hợp có thiệt hại thì phải bồi thường thiệt hại theo quy định sau đây:", leading: 5
    p "-  Tiền bồi thường thiệt hại bao gồm giá trị số tài sản mất mát, hư hỏng, số chi phí để ngăn chặn và hạn chế thiệt hại vi phạm gây ra; Hoặc tiền phạt vi phạm hợp đồng và tiền bồi thường thiệt hại mà bên bị vi phạm đã phải trả cho bên thứ ba là hậu quả trực tiếp của sự vi phạm này gây ra.", leading: 5

    move_down 10
    p "<u>Điều 6: Chấm dứt hợp đồng</u>", style: :bold, inline_format: true
    p "Hợp đồng thuê thiết bị này chỉ có thể bị chấm dứt bởi một trong những trường hợp sau đây:"
    p "-  Hết hạn thuê theo hợp đồng;"
    p "-  Theo yêu cầu của một trong hai bên;"
    p "-  Lý do bất khả kháng khác."
    p "Khi chấm dứt việc thực hiện hợp đồng các bên sẽ tiến hành thanh lý, hoàn trả máy móc thiết bị, thanh toán mọi khoản tài chính liên quan.", leading: 5

    move_down 10
    p "<u>Điều 7: Giải quyết tranh chấp</u>", style: :bold, inline_format: true
    p "Hai bên cam kết thực hiện nghiêm túc đầy đủ các điều khoản đã ghi trong hợp đồng này. Trong quá trình thực hiện có gì vướng mắc hai bên cùng bàn bạc trên tinh thần hữu nghị hợp tác. Trong trường hợp hai bên không thể tự thoả thuận được thì sẽ đưa vụ việc ra Toà án nhân dân có thẩm quyền tại Thành Phố Hồ Chí Minh để giải quyết theo pháp luật Việt Nam.", leading: 5
    move_down 20
    p "Hợp đồng được lập thành 2 bản, mỗi bên giữ 1 bản có giá trị pháp lý như nhau và có hiệu lực kể từ ngày ký.", leading: 5
    move_down 20
    indent(40) do
      text "Đại diện Bên A                                                                    Đại diện Bên B", style: :bold
    end
    text "\n"
    text "\n"
    text "\n"
    text "\n"
    text "\n"
    text "\n"
    text "\n"
    text "\n"
    indent(25) do
      text "Nghiêm Xuân Hoàng", style: :bold
    end
  end

  def p(str, options={})
    text str, options
    move_down 10
  end

end