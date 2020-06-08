RSpec.describe Jptax do
  it "has a version number" do
    expect(Jptax::VERSION).not_to be nil
  end

  describe '.tax_amount' do
    subject { Jptax.amount_with_tax(amount, amount_for_reduced) }

    context '通常税率と軽減税率を指定した場合' do
      let(:amount) { 1000 }
      let(:amount_for_reduced) { 2000 }

      it '正しい計算結果を返す' do
        is_expected.to eq 3260
      end
    end

    context '全て0の場合' do
      let(:amount) { 0 }
      let(:amount_for_reduced) { 0 }

      it '0を返す' do
        is_expected.to eq 0
      end
    end

    context '端数が発生する場合で、丸め方法を指定しなかった場合' do
      let(:amount) { 1000 }
      let(:amount_for_reduced) { 1999 }

      it '切り捨てられる' do
        is_expected.to eq 3258
      end
    end

    context '端数が発生する場合で、丸め方法を`floor`に指定した場合' do
      let(:amount) { 1000 }
      let(:amount_for_reduced) { 1999 }

      it '切り捨てられる' do
        expect(Jptax.amount_with_tax(amount, amount_for_reduced, 'floor')).to eq 3258
      end
    end

    context '端数が発生する場合で、丸め方法を`ceil`に指定した場合' do
      it '切り上げられる' do
        expect(Jptax.amount_with_tax(1000, 1999, 'ceil')).to eq 3259
      end
    end

    context '端数が発生する場合で、丸め方法を`round`に指定した場合' do
      it '四捨五入される' do
        expect(Jptax.amount_with_tax(1000, 1999, 'round')).to eq 3259
        expect(Jptax.amount_with_tax(1000, 1989, 'round')).to eq 3248
      end
    end

    context '通常税率のみ指定した場合' do
      let(:amount) { 1000 }

      it '正しい計算結果が返る' do
        expect(Jptax.amount_with_tax(amount)).to eq 1100
      end
    end

    context '全てnilの場合' do
      let(:amount) { nil }
      let(:amount_for_reduced) { nil }

      it '0を返す' do
        is_expected.to eq 0
      end
    end

    context '通常税率が nil の場合' do
      let(:amount) { nil }
      let(:amount_for_reduced) { 1000 }

      it '正しい計算結果が返る' do
        expect(Jptax.amount_with_tax(amount, amount_for_reduced)).to eq 1080
      end
    end

    context '軽減税率が nil の場合' do
      let(:amount) { 1000 }
      let(:amount_for_reduced) { nil }

      it '正しい計算結果が返る' do
        expect(Jptax.amount_with_tax(amount, amount_for_reduced)).to eq 1100
      end
    end
  end
end
