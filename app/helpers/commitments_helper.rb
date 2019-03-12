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

  def set_status(commitment)
    if backlog?(commitment)
      commitment.status = 0
    elsif waiting?(commitment)
      commitment.status = 1
    elsif this_week?(commitment)
      commitment.status = 2
    elsif today?(commitment)
      commitment.status = 3
    elsif expired?(commitment)
      commitment.status = 4
    elsif closed_before_deadline?(commitment)
      commitment.status = 5
    elsif closed_after_deadline?(commitment)
      commitment.status = 6
    else
      commitment.status = nil
    end
  end

  def return_status(commitment)
    if backlog?(commitment)
      0
    elsif waiting?(commitment)
      1
    elsif this_week?(commitment)
      2
    elsif today?(commitment)
      3
    elsif expired?(commitment)
      4
    elsif closed_before_deadline?(commitment)
      5
    elsif closed_after_deadline?(commitment)
      6
    end
  end

  def last_date(commitment)
    commitment.renegotiation_date.nil? ? commitment.due_date : commitment.renegotiation_date
  end

  def closed?(commitment)
    commitment.closing_date.nil? ? false : true
  end

  def backlog?(commitment)
    last_date(commitment).nil? && !closed?(commitment)
  end

  def waiting?(commitment)
    if !closed?(commitment)
      last_date(commitment) > Date.today.at_end_of_week
    end
  end

  def this_week?(commitment)
    week_starts = Date.today.at_beginning_of_week
    week_ends = Date.today.at_end_of_week
    if !closed?(commitment) && !today?(commitment)
      last_date(commitment) >= week_starts && last_date(commitment) <= week_ends
    end
  end

  def today?(commitment)
    today = Date.today
    if !closed?(commitment)
      last_date(commitment) == today
    end
  end

  def expired?(commitment)
    today = Date.today
    if closed?(commitment).nil?
      if !last_date(commitment).nil?
        last_date(commitment) > Date.today
      end
    end
  end

  def closed_after_deadline?(commitment)
    if closed?(commitment)
      if last_date(commitment).nil?
        false
      else
        commitment.closing_date > last_date(commitment)
      end
    end
  end

  def closed_before_deadline?(commitment)
    if closed?(commitment)
      if last_date(commitment).nil?
        true
      else
        commitment.closing_date <= last_date(commitment)
      end
    end
  end
end
