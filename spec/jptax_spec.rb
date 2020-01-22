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

    context '端数が発生する場合' do
      let(:amount) { 1000 }
      let(:amount_for_reduced) { 1999 }

      it '切り捨てられる' do
        is_expected.to eq 3258
      end
    end

    context '通常税率のみ指定した場合' do
      let(:amount) { 1000 }

      it '正しい計算結果が返る' do
        expect(Jptax.amount_with_tax(amount)).to eq 1100
      end
    end
  end
end
