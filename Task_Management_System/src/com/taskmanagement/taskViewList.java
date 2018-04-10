package com.taskmanagement;

public class taskViewList {
	
	private String task;
	private String assignedTo;
	private String assignedBy;
	private String scheduledDate;
	private String status;
	private String notes;
	private String taskId;
	
	public void setTaskId(String taskId)
	{
		this.taskId = taskId;
	}
	
	public String getTaskId()
	{
		return taskId;
	}
	
	public void setTask(String task)
	{
		this.task = task;
	}
	
	public String getTask()
	{
		return task;
	}
	
	public void setAssignedTo(String assignedTo)
	{
		this.assignedTo = assignedTo;
	}
	
	public String getAssignedTo()
	{
		return assignedTo;
	}
	
	public void setAssignedBy(String assignedBy)
	{
		this.assignedBy = assignedBy;
	}
	
	public String getAssignedBy()
	{
		return assignedBy;
	}
	
	public void setScheduledDate(String scheduledDate)
	{
		this.scheduledDate = scheduledDate;
	}
	
	public String getScheduledDate()
	{
		return scheduledDate;
	}
	
	public void setStatus(String status)
	{
		this.status = status;
	}
	
	public String getStatus()
	{
		return status;
	}
	
	public void setNotes(String notes)
	{
		this.notes = notes;
	}
	
	public String getNotes()
	{
		return notes;
	}
	
}
