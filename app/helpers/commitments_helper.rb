module CommitmentsHelper
  def status_by_color(commitment)
    if commitment.status == 0
      "#cdffeb"
    elsif commitment.status == 1
      "#009f9d"
    elsif commitment.status == 2
      "#07456f"
    elsif commitment.status == 3
      "#0f0a3c"
    elsif commitment.status == 4

    end
  end
end
